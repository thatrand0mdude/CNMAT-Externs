/*
Written by John MacCallum, The Center for New Music and Audio Technologies,
University of California, Berkeley.  Copyright (c) 2009, The Regents of
the University of California (Regents). 
Permission to use, copy, modify, distribute, and distribute modified versions
of this software and its documentation without fee and without a signed
licensing agreement, is hereby granted, provided that the above copyright
notice, this paragraph and the following two paragraphs appear in all copies,
modifications, and distributions.

IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT,
SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING
OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS
BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED
HEREUNDER IS PROVIDED "AS IS". REGENTS HAS NO OBLIGATION TO PROVIDE
MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
NAME: hasar
DESCRIPTION: A hasarle for Max
AUTHORS: John MacCallum
COPYRIGHT_YEARS: 2009
SVN_REVISION: $LastChangedRevision: 587 $
VERSION 0.0: First try
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
*/

/* Description of the object:

 */

#include "ext.h"
#include "ext_obex.h"
#include "ext_obex_util.h"
#include "ext_hasar.h" 	// Hasarle header
#include "ext_linklist.h"	// LinkList header
#include <math.h>

#define AR_DEFAULT_SLOTS 512

typedef struct _ar{
	t_object ob;
	void *outlets[4];
	t_symbol *name;  // The name of our object
	t_symbol *iname_ht; // The internal name of our hasarle
	t_symbol *iname_ll; // The internal name of our linked list
	void *current_item;
} t_ar;

static t_class *ar_class;

void ar_count(t_ar *x);
void ar_store(t_ar *x, t_symbol *msg, short argc, t_atom *argv);
void ar_lookup(t_ar *x, t_symbol *msg, short argc, t_atom *argv);
void ar_keys(t_ar *x);
void ar_output_key(t_symbol *key, void *xx);
void ar_output_key_and_value(t_symbol *key, void *xx);
void ar_hasar(t_ar *x, t_symbol *name);
void ar_clear(t_ar *x);
void ar_dump(t_ar *x);
void ar_bang(t_ar *x);
void ar_next(t_ar *x);
void ar_prev(t_ar *x);
void ar_goto(t_ar *x, long n);
void ar_head(t_ar *x);
void ar_tail(t_ar *x);
void ar_remove_index(t_ar *x, long i);
void ar_remove_key(t_ar *x, t_symbol *msg, short argc, t_atom *argv);
void ar_remove_encoded_key(t_hasar *ht, t_linklist *ll, t_symbol *encoded_key);
void ar_swap_indices(t_ar *x, long l1, long l2);
void ar_swap_keys(t_ar *x, t_symbol *msg, long argc, t_atom *argv);
void ar_reorder_indices(t_ar *x, t_symbol *msg, short argc, t_atom *argv);
void ar_reorder_keys(t_ar *x, t_symbol *msg, short argc, t_atom *argv);
void ar_scramble(t_ar *x);
void ar_random(t_ar *x);
void ar_int(t_ar *x, long n);
void ar_float(t_ar *x, double xx);
void ar_list(t_ar *x, t_symbol *msg, short argc, t_atom *argv);
void ar_anything(t_ar *x, t_symbol *msg, short argc, t_atom *argv);
void ar_free(t_ar *x);
void ar_assist(t_ar *x, void *b, long m, long a, char *s);
t_symbol *ar_make_iname(t_symbol *name, char *type);
t_symbol *ar_encode_key(t_atom *a);
t_symbol *ar_encode_key_from_float(float f);
t_symbol *ar_encode_key_from_int(long l);
t_symbol *ar_encode_key_from_symbol(t_symbol *s);
void ar_decode_key(t_symbol *s, t_atom *a);
void ar_inc_refcount(t_ar *x, t_symbol *name);
void ar_dec_refcount(t_ar *x, t_symbol *name);
void ar_set(t_ar *x, t_symbol *name);
t_symbol *ar_make_def_name();
void *ar_new(t_symbol *name, long size);
void ar_tellmeeverything(t_ar *x);
unsigned int makeseed(void);

t_symbol *_sym_hasar;

static unsigned int ar_instance_counter = 0;

void ar_count(t_ar *x){
	t_hasar *ht;
	if(!(ht = (t_hasar *)x->iname_ht->s_thing)){
		return;
	}
	outlet_int(x->outlets[0], hasar_getsize(ht));
}

void ar_store(t_ar *x, t_symbol *msg, short argc, t_atom *argv){
	t_hasar *ht;
	t_linklist *ll;
	if(!(ht = (t_hasar *)x->iname_ht->s_thing) || !(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}
	if(argc < 2){
		return;
	}

	t_atombuf *ab = (t_atombuf *)atombuf_new(argc - 1, argv + 1);
	t_symbol *key = ar_encode_key(argv);
	hasar_store(ht, key, (t_object *)ab);
	linklist_append(ll, key);
}

void ar_lookup(t_ar *x, t_symbol *msg, short argc, t_atom *argv){
	t_hasar *ht;
	if(!(ht = (t_hasar *)x->iname_ht->s_thing)){
		return;
	}
	if(argc < 1){
		return;
	}
	t_atombuf *ab;
	hasar_lookup(ht, ar_encode_key(argv), (t_object **)(&ab));
	if(ab){
		outlet_list(x->outlets[1], NULL, 1, argv);
		outlet_list(x->outlets[0], NULL, ab->a_argc, ab->a_argv);
	}
}

void ar_keys(t_ar *x){
	t_linklist *ll;
	if(!(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}
	linklist_funall(ll, (method)ar_output_key, (void *)x);
}

void ar_output_key(t_symbol *key, void *xx){
	t_ar *x = (t_ar *)xx;
	t_atom a;
	ar_decode_key(key, &a);
	if(a.a_type == A_FLOAT){
		outlet_float(x->outlets[0], a.a_w.w_float);
	}else if(a.a_type == A_LONG){
		outlet_int(x->outlets[0], a.a_w.w_long);
	}else{
		outlet_anything(x->outlets[0], a.a_w.w_sym, 0, NULL);
	}
}

void ar_output_key_and_value(t_symbol *key, void *xx){
	t_ar *x = (t_ar *)xx;
	t_atom a;
	ar_decode_key(key, &a);
	ar_lookup(x, NULL, 1, &a);
}

void ar_hasar(t_ar *x, t_symbol *name){
	t_symbol *iname_ht = ar_make_iname(name, "hasar");
	t_hasar *incoming_ht = (t_hasar *)(iname_ht->s_thing);
	t_hasar *ht;
	t_linklist *ll;
	t_symbol **keys = NULL;
	long numKeys = 0;
	long i;
	hasar_getkeys(incoming_ht, &numKeys, &keys);
	if(!(ht = (t_hasar *)x->iname_ht->s_thing) || !(ll = (t_linklist *)x->iname_ll->s_thing)){
		ht = hasar_new(AR_DEFAULT_SLOTS);
		ll = linklist_new();
		x->iname_ht->s_thing = (void *)ht;
		x->iname_ll->s_thing = (void *)ll;
	}
	ar_clear(x);
	for(i = 0; i < numKeys; i++){
		t_atombuf *ab1, *ab2;
		hasar_lookup(incoming_ht, keys[i], (t_object **)(&ab1));
		ab2 = (t_atombuf *)atombuf_new(ab1->a_argc, ab1->a_argv);
		hasar_store(ht, keys[i], (t_object *)ab2);
		linklist_append(ll, keys[i]);
	}
}

void ar_clear(t_ar *x){
	t_hasar *ht;
	t_linklist *ll;
	if(!(ht = (t_hasar *)x->iname_ht->s_thing) || !(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}
	t_symbol **keys = NULL;
	long numKeys = 0;
	long i;
	t_atombuf *ab;
	hasar_getkeys(ht, &numKeys, &keys);
	for(i = 0; i < numKeys; i++){
		hasar_lookup(ht, keys[i], (t_object **)(&ab));
		if(ab){
			atombuf_free(ab);
		}
		hasar_chuckkey(ht, keys[i]);
		linklist_chuckobject(ll, keys[i]);
	}
}

void ar_dump(t_ar *x){
	t_linklist *ll;
	if(!(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}
	linklist_funall(ll, (method)ar_output_key_and_value, (void *)x);
	outlet_anything(x->outlets[3], _sym_bang, 0, NULL);
}

void ar_bang(t_ar *x){
	t_atom a;
	atom_setsym(&a, x->name);
	outlet_anything(x->outlets[0], _sym_hasar, 1, &a);
}

void ar_next(t_ar *x){
	t_hasar *ht;
	t_linklist *ll;
	if(!(ht = (t_hasar *)x->iname_ht->s_thing) || !(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}
	if(!(x->current_item)){
		x->current_item = linklist_getindex(ll, 0);
	}else{
		linklist_next(ll, x->current_item, &(x->current_item));
		if(!(x->current_item)){
			//x->current_item = linklist_getindex(ll, 0);
			outlet_anything(x->outlets[3], _sym_bang, 0, NULL);
		}
	}
	if(x->current_item){
		t_atombuf *ab;
		t_atom a;
		ar_decode_key((t_symbol *)(x->current_item), &a);
		hasar_lookup(ht, (t_symbol *)(x->current_item), (t_object **)(&ab));
		if(ab){
			outlet_list(x->outlets[1], NULL, 1, &a);
			outlet_list(x->outlets[0], NULL, ab->a_argc, ab->a_argv);
		}
	}
}

void ar_prev(t_ar *x){
	t_hasar *ht;
	t_linklist *ll;
	if(!(ht = (t_hasar *)x->iname_ht->s_thing) || !(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}
	if(!(x->current_item)){
		x->current_item = linklist_getindex(ll, hasar_getsize(ht) - 1);
	}else{
		linklist_prev(ll, x->current_item, &(x->current_item));
		if(!(x->current_item)){
			//x->current_item = linklist_getindex(ll, hasar_getsize(ht) - 1);
			outlet_anything(x->outlets[3], _sym_bang, 0, NULL);
		}
	}
	if(x->current_item){
		t_atombuf *ab;
		t_atom a;
		ar_decode_key((t_symbol *)(x->current_item), &a);
		hasar_lookup(ht, (t_symbol *)(x->current_item), (t_object **)(&ab));
		if(ab){
			outlet_list(x->outlets[1], NULL, 1, &a);
			outlet_list(x->outlets[0], NULL, ab->a_argc, ab->a_argv);
		}
	}
}

void ar_goto(t_ar *x, long n){
	t_hasar *ht;
	t_linklist *ll;
	if(!(ht = (t_hasar *)x->iname_ht->s_thing) || !(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}

	x->current_item = linklist_getindex(ll, n);
	if(x->current_item){
		t_atombuf *ab;
		t_atom a;
		ar_decode_key((t_symbol *)(x->current_item), &a);
		hasar_lookup(ht, (t_symbol *)(x->current_item), (t_object **)(&ab));
		if(ab){
			outlet_list(x->outlets[1], NULL, 1, &a);
			outlet_list(x->outlets[0], NULL, ab->a_argc, ab->a_argv);
		}
	}
}

void ar_head(t_ar *x){
	ar_goto(x, 0);
}

void ar_tail(t_ar *x){
	t_hasar *ht;
	if(!(ht = (t_hasar *)x->iname_ht->s_thing)){
		return;
	}
	ar_goto(x, hasar_getsize(ht) - 1);
}

void ar_remove_index(t_ar *x, long i){
	t_hasar *ht;
	t_linklist *ll;
	if(!(ht = (t_hasar *)x->iname_ht->s_thing) || !(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}
	t_symbol *key = (t_symbol *)linklist_getindex(ll, i);
	if(key){
		ar_remove_encoded_key(ht, ll, key);
	}
}

void ar_remove_key(t_ar *x, t_symbol *msg, short argc, t_atom *argv){
	t_hasar *ht;
	t_linklist *ll;
	if(!(ht = (t_hasar *)x->iname_ht->s_thing) || !(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}
	ar_remove_encoded_key(ht, ll, ar_encode_key(argv));
}

void ar_remove_encoded_key(t_hasar *ht, t_linklist *ll, t_symbol *encoded_key){
	if(!ht || !ll){
		return;
	}
	if(encoded_key){
		t_atombuf *ab;
		hasar_lookup(ht, encoded_key, (t_object **)(&ab));
		if(ab){
			atombuf_free(ab);
		}
		hasar_chuckkey(ht, encoded_key);
		linklist_chuckobject(ll, encoded_key);

	}
}

void ar_swap_indices(t_ar *x, long l1, long l2){
	if(l1 < 0 || l2 < 0){
		return;
	}
	t_linklist *ll;
	if(!(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}
	linklist_swap(ll, l1, l2);
}

void ar_swap_keys(t_ar *x, t_symbol *msg, long argc, t_atom *argv){
	if(argc != 2){
		error("hasar: swap_keys requires 2 arguments, not %d", argc);
		return;
	}
	t_linklist *ll;
	if(!(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}
	t_symbol *key1 = ar_encode_key(argv);
	t_symbol *key2 = ar_encode_key(argv + 1);
	t_symbol *test_key = (t_symbol *)linklist_getindex(ll, 0);
	int l1 = -1;
	int l2 = -1;
	int i = 0;
	while((l1 == -1 || l2 == -1) && i < linklist_getsize(ll)){
		if(test_key == key1){
			l1 = i;
		}
		if(test_key == key2){
			l2 = i;
		}
		i++;
		linklist_next(ll, (void *)test_key, (void **)(&test_key));
	}
	// this function will check to make sure that l1 and l2 are both greater than 0
	ar_swap_indices(x, l1, l2);
}

void ar_reorder_indices(t_ar *x, t_symbol *msg, short argc, t_atom *argv){

}

void ar_reorder_keys(t_ar *x, t_symbol *msg, short argc, t_atom *argv){

}

void ar_scramble(t_ar *x){
	t_linklist *ll;
	if(!(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}
	linklist_shuffle(ll);
}

void ar_random(t_ar *x){
	t_hasar *ht;
	t_linklist *ll;
	if(!(ht = (t_hasar *)x->iname_ht->s_thing) || !(ll = (t_linklist *)x->iname_ll->s_thing)){
		return;
	}
	int n = hasar_getsize(ht) - 1;
	int r = (int)round(((double)rand() / (double)RAND_MAX) * n);
	x->current_item = linklist_getindex(ll, r);
	if(x->current_item){
		t_atombuf *ab;
		t_atom a;
		ar_decode_key((t_symbol *)(x->current_item), &a);
		hasar_lookup(ht, (t_symbol *)(x->current_item), (t_object **)(&ab));
		if(ab){
			outlet_list(x->outlets[1], NULL, 1, &a);
			outlet_list(x->outlets[0], NULL, ab->a_argc, ab->a_argv);
		}
	}
}

void ar_int(t_ar *x, long n){
}

void ar_float(t_ar *x, double f){
}

void ar_list(t_ar *x, t_symbol *msg, short argc, t_atom *argv){
}

void ar_anything(t_ar *x, t_symbol *msg, short argc, t_atom *argv){
}

void ar_free(t_ar *x){
	ar_dec_refcount(x, x->name);
}

void ar_assist(t_ar *x, void *b, long io, long index, char *s){
	switch(io){
	case 1:
		switch(index){
		case 0:
			sprintf(s, "Store or recall data");
			break;
		}
		break;
	case 2:
		switch(index){
		case 0:
			sprintf(s, "Data that has been recalled");
			break;
		}
		break;
	}
}

t_symbol *ar_make_iname(t_symbol *name, char *type){
	char *name_char = name->s_name;
	char iname_char[64];
	sprintf(iname_char, "cnmat_%s_%s", type, name_char);
	return gensym(iname_char);
}

t_symbol *ar_encode_key(t_atom *a){
	if(a[0].a_type == A_FLOAT){
		return ar_encode_key_from_float(a[0].a_w.w_float);
	}else if(a[0].a_type == A_LONG){
		return ar_encode_key_from_int(a[0].a_w.w_long);
	}else{
		return ar_encode_key_from_symbol(a[0].a_w.w_sym);
	}
}

t_symbol *ar_encode_key_from_float(float f){
	char buf[9];
	sprintf(buf, "f%x", *((unsigned int *)(&f)));
	return gensym(buf);
}

t_symbol *ar_encode_key_from_int(long l){
	char buf[9];
	sprintf(buf, "d%x", (unsigned int)l);
	return gensym(buf);
}

t_symbol *ar_encode_key_from_symbol(t_symbol *s){
	char buf[128];
	sprintf(buf, "s%s", s->s_name);
	return gensym(buf);
}

void ar_decode_key(t_symbol *s, t_atom *a){
	char *cp = s->s_name;
	if(cp[0] == 'f'){
		float f;
		sscanf(cp + 1, "%x", (unsigned int *)(&f));
		atom_setfloat(a, f);
	}else if(cp[0] == 'd'){
		unsigned long l;
		sscanf(cp + 1, "%x", (unsigned int *)(&l));
		atom_setlong(a, (long)l);
	}else{
		atom_setsym(a, gensym(cp + 1));
	}
}

void ar_inc_refcount(t_ar *x, t_symbol *name){
	t_symbol *refcount = ar_make_iname(name, "refcount");
	//post("inc refcount for %s", name->s_name);
	if(!(refcount->s_thing)){
		//post("null pointer");
		refcount->s_thing = (void *)1;
	}else{
		//post("incrementing");
		long count = ((long)(refcount->s_thing));
		count++;
		refcount->s_thing = (void *)count;
	}
}

void ar_dec_refcount(t_ar *x, t_symbol *name){
	t_symbol *refcount = ar_make_iname(name, "refcount");
	long count = ((long)(refcount->s_thing));
	count--;
	refcount->s_thing = (void *)count;
	if(count == 0){
		//post("freeing %s", name->s_name);
		ar_clear(x);
	}

}

void ar_set(t_ar *x, t_symbol *name){
	if(name == x->name){
		return;
	}
	t_symbol *iname_ht = ar_make_iname(name, "hasar");
	t_symbol *iname_ll = ar_make_iname(name, "linklist");
	if((t_hasar *)iname_ht->s_thing && (t_linklist *)iname_ll->s_thing){
		/*
		t_symbol *refcount;
		if(x->name != _sym_emptytext){
			refcount = ar_make_iname(x->name, "refcount");
			(*((long *)refcount->s_thing))--;
			post("refcount for %s = %d", x->name->s_name, *((long *)refcount->s_thing));
		}
		*/
		ar_dec_refcount(x, x->name);
		x->name = name;
		x->iname_ht = iname_ht;
		x->iname_ll = iname_ll;
		//refcount = ar_make_iname(x->name, "refcount");
		//(*((long *)refcount->s_thing))++;
		ar_inc_refcount(x, x->name);
		//post("refcount for %s = %d", x->name->s_name, *((long *)refcount->s_thing));
	}else{
		error("hasar: There is no hasarle called %s", name->s_name);
		return;
	}
}

t_symbol *ar_make_def_name(){
	unsigned int n = ++ar_instance_counter;
	char buf[10];
	sprintf(buf, "0x%08x", n);
	return gensym(buf);
}


/**************************************************
Object and instance creation functions.
 **************************************************/

void *ar_new(t_symbol *name, long size){
	t_ar *x;

	if(x = (t_ar *)object_alloc(ar_class)){
		t_hasar *ht;
		t_linklist *ll;
		x->outlets[3] = outlet_new(x, NULL);
		x->outlets[2] = outlet_new(x, NULL);
		x->outlets[1] = outlet_new(x, NULL);
		x->outlets[0] = outlet_new(x, NULL);
		if(strlen(name->s_name) > 0){
			x->name = name;
			x->iname_ht = ar_make_iname(name, "hasar");
			x->iname_ll = ar_make_iname(name, "linklist");
			ar_inc_refcount(x, x->name);
			if(ht = (t_hasar *)(name->s_thing)){
			}else{
				ht = (t_hasar *)hasar_new(size);
				x->iname_ht->s_thing = (t_object *)ht;
				ll = (t_linklist *)linklist_new();
				x->iname_ll->s_thing = (t_object *)ll;
			}
		}else{
			x->name = ar_make_def_name();
			x->iname_ht = ar_make_iname(x->name, "hasar");
			x->iname_ll = ar_make_iname(x->name, "linklist");
			ar_inc_refcount(x, x->name);
			/*
			x->name = _sym_emptytext;
			x->iname_ht = _sym_emptytext;
			x->iname_ll = _sym_emptytext;
			*/
		}
		srand(makeseed());
		return x;
	}
	return NULL;
}

int main(void){
	t_class *c = class_new("hasar", (method)ar_new, (method)ar_free, sizeof(t_ar), 0L, A_DEFSYM, A_DEFLONG, 0);

	class_addmethod(c, (method)ar_count, "count", 0);
	class_addmethod(c, (method)ar_store, "store", A_GIMME, 0);
	class_addmethod(c, (method)ar_lookup, "lookup", A_GIMME, 0);
	class_addmethod(c, (method)ar_keys, "keys", 0);
	class_addmethod(c, (method)ar_set, "set", A_SYM, 0);
	class_addmethod(c, (method)ar_hasar, "hasar", A_SYM, 0);
	class_addmethod(c, (method)ar_clear, "clear", 0);
	class_addmethod(c, (method)ar_dump, "dump", 0);

	class_addmethod(c, (method)ar_bang, "bang", 0);
	class_addmethod(c, (method)ar_next, "next", 0);
	class_addmethod(c, (method)ar_prev, "prev", 0);
	class_addmethod(c, (method)ar_goto, "goto", A_DEFLONG, 0);
	class_addmethod(c, (method)ar_head, "head", 0);
	class_addmethod(c, (method)ar_tail, "tail", 0);
	class_addmethod(c, (method)ar_scramble, "scramble", 0);
	class_addmethod(c, (method)ar_random, "random", 0);
	class_addmethod(c, (method)ar_remove_index, "remove_index", A_LONG, 0);
	class_addmethod(c, (method)ar_remove_key, "remove_key", A_GIMME, 0);
	class_addmethod(c, (method)ar_swap_indices, "swap_indices", A_LONG, A_LONG, 0);
	class_addmethod(c, (method)ar_swap_keys, "swap_keys", A_GIMME, 0);
	class_addmethod(c, (method)ar_tellmeeverything, "tellmeeverything", 0);

	class_addmethod(c, (method)ar_int, "int", A_LONG, 0);
	class_addmethod(c, (method)ar_float, "float", A_FLOAT, 0);
	class_addmethod(c, (method)ar_list, "list", A_GIMME, 0);
	class_addmethod(c, (method)ar_anything, "anything", A_GIMME, 0);
	class_addmethod(c, (method)ar_assist, "assist", A_CANT, 0);
	class_addmethod(c, (method)stdinletinfo, "inletinfo", A_CANT, 0);

	class_register(CLASS_BOX, c);
	ar_class = c;

	common_symbols_init();

	_sym_hasar = gensym("hasar");

	return 0;
}

void ar_tellmeeverything(t_ar *x){
	post("name = %s", x->name->s_name);
	t_symbol *refcount = ar_make_iname(x->name, "refcount");
	post("refcount %d", (long)(refcount->s_thing));
}

unsigned int makeseed(void){
	/* from PD x_misc.c
    	static unsigned int random_nextseed = 1489853723;
    	random_nextseed = random_nextseed * 435898247 + 938284287;
    	return (random_nextseed & 0x7fffffff);
	*/

	unsigned int r;
	FILE *f;

#ifdef Windows
#else
	f = fopen("/dev/random", "r");
#endif
	fread(&r, sizeof(r), 1, f);
	fclose(f);

	//post("%u\n", randval);
	return r;
}