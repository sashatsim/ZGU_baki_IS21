PGDMP     7    +                {            laba_1    15.2    15.2 J    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16771    laba_1    DATABASE     z   CREATE DATABASE laba_1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE laba_1;
                postgres    false            �            1259    16792    product    TABLE     �   CREATE TABLE public.product (
    id_product integer NOT NULL,
    type_product character varying(64) NOT NULL,
    price integer NOT NULL
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    17092    allproducts    VIEW     �   CREATE VIEW public.allproducts AS
 SELECT product.type_product,
    count(*) AS count
   FROM public.product
  GROUP BY product.type_product
  ORDER BY (count(*)) DESC;
    DROP VIEW public.allproducts;
       public          postgres    false    218            �            1259    16885    client    TABLE       CREATE TABLE public.client (
    id_client integer NOT NULL,
    fk_product_id integer,
    profit integer NOT NULL,
    adress character varying(64) NOT NULL,
    surname character varying(64),
    extra_charge integer,
    CONSTRAINT client_profit_check CHECK ((profit > 0))
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16787    sotr    TABLE       CREATE TABLE public.sotr (
    id_sotr integer NOT NULL,
    surname character varying(64) NOT NULL,
    forename character varying(64) NOT NULL,
    patronymic character varying(64) NOT NULL,
    position_sotr character varying(64) NOT NULL,
    parent_id integer,
    id integer
);
    DROP TABLE public.sotr;
       public         heap    postgres    false            �            1259    17096    allsotr    MATERIALIZED VIEW     �   CREATE MATERIALIZED VIEW public.allsotr AS
 SELECT sotr.patronymic
   FROM public.sotr
UNION ALL
 SELECT client.surname AS patronymic
   FROM public.client
  WITH NO DATA;
 '   DROP MATERIALIZED VIEW public.allsotr;
       public         heap    postgres    false    222    217            �            1259    16772    post_met    TABLE     	  CREATE TABLE public.post_met (
    post_met_id integer NOT NULL,
    name_post character varying(64) NOT NULL,
    type_material character varying(64) NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL,
    adress character varying(64) NOT NULL
);
    DROP TABLE public.post_met;
       public         heap    postgres    false            �            1259    17100    compania    VIEW     o   CREATE VIEW public.compania AS
 SELECT post_met.name_post,
    post_met.type_material
   FROM public.post_met;
    DROP VIEW public.compania;
       public          postgres    false    214    214            �            1259    16822    company    TABLE     �   CREATE TABLE public.company (
    id_company integer NOT NULL,
    fk_materials_id integer,
    fk_sotr_id integer,
    fk_product_id integer,
    adress character varying(64) NOT NULL
);
    DROP TABLE public.company;
       public         heap    postgres    false            �            1259    16882    company_client    TABLE     n   CREATE TABLE public.company_client (
    fk_company_id integer NOT NULL,
    fk_client_id integer NOT NULL
);
 "   DROP TABLE public.company_client;
       public         heap    postgres    false            �            1259    16949    company_tkan    TABLE       CREATE TABLE public.company_tkan (
    company_tkan_id integer NOT NULL,
    company_name character varying(64) NOT NULL,
    adress character varying(64) NOT NULL,
    ctoimost_uslug integer NOT NULL,
    type_tkan character varying(64) NOT NULL,
    fk_copmany_post_stan_id integer
);
     DROP TABLE public.company_tkan;
       public         heap    postgres    false            �            1259    16802 	   materials    TABLE     �   CREATE TABLE public.materials (
    id_materials integer NOT NULL,
    fk_post_met_id integer,
    fk_post_inst_id integer,
    fk_post_stan_id integer,
    fk_type_tkan_id character varying(64)
);
    DROP TABLE public.materials;
       public         heap    postgres    false            �            1259    16777 	   post_inst    TABLE       CREATE TABLE public.post_inst (
    post_inst_id integer NOT NULL,
    name_post character varying(64) NOT NULL,
    type_material character varying(64) NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL,
    adress character varying(64) NOT NULL
);
    DROP TABLE public.post_inst;
       public         heap    postgres    false            �            1259    16782 	   post_stan    TABLE       CREATE TABLE public.post_stan (
    post_stan_id integer NOT NULL,
    name_post character varying(64) NOT NULL,
    type_material character varying(64) NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL,
    adress character varying(64) NOT NULL
);
    DROP TABLE public.post_stan;
       public         heap    postgres    false            �            1259    17046    proba_company4    TABLE       CREATE TABLE public.proba_company4 (
    id_proba integer NOT NULL,
    name_company character varying(64),
    inn_comany integer NOT NULL,
    price_uslug integer,
    fk_post_met_id integer,
    CONSTRAINT proba_company4_price_uslug_check CHECK ((price_uslug > 0))
);
 "   DROP TABLE public.proba_company4;
       public         heap    postgres    false            �            1259    17062    table1    TABLE     }   CREATE TABLE public.table1 (
    table_id integer NOT NULL,
    name_table character varying(64),
    fk_table_id integer
);
    DROP TABLE public.table1;
       public         heap    postgres    false            �            1259    17067    table2    TABLE     ~   CREATE TABLE public.table2 (
    table_id integer NOT NULL,
    name_table character varying(64),
    fl_table1_id integer
);
    DROP TABLE public.table2;
       public         heap    postgres    false            �            1259    17077    table3    TABLE     ~   CREATE TABLE public.table3 (
    table_id integer NOT NULL,
    name_table character varying(64),
    fl_table1_id integer
);
    DROP TABLE public.table3;
       public         heap    postgres    false            y          0    16885    client 
   TABLE DATA           a   COPY public.client (id_client, fk_product_id, profit, adress, surname, extra_charge) FROM stdin;
    public          postgres    false    222   ^]       w          0    16822    company 
   TABLE DATA           a   COPY public.company (id_company, fk_materials_id, fk_sotr_id, fk_product_id, adress) FROM stdin;
    public          postgres    false    220   �]       x          0    16882    company_client 
   TABLE DATA           E   COPY public.company_client (fk_company_id, fk_client_id) FROM stdin;
    public          postgres    false    221   G^       z          0    16949    company_tkan 
   TABLE DATA           �   COPY public.company_tkan (company_tkan_id, company_name, adress, ctoimost_uslug, type_tkan, fk_copmany_post_stan_id) FROM stdin;
    public          postgres    false    223   p^       v          0    16802 	   materials 
   TABLE DATA           t   COPY public.materials (id_materials, fk_post_met_id, fk_post_inst_id, fk_post_stan_id, fk_type_tkan_id) FROM stdin;
    public          postgres    false    219   �^       r          0    16777 	   post_inst 
   TABLE DATA           d   COPY public.post_inst (post_inst_id, name_post, type_material, quantity, price, adress) FROM stdin;
    public          postgres    false    215   <_       q          0    16772    post_met 
   TABLE DATA           b   COPY public.post_met (post_met_id, name_post, type_material, quantity, price, adress) FROM stdin;
    public          postgres    false    214   �_       s          0    16782 	   post_stan 
   TABLE DATA           d   COPY public.post_stan (post_stan_id, name_post, type_material, quantity, price, adress) FROM stdin;
    public          postgres    false    216   �`       {          0    17046    proba_company4 
   TABLE DATA           i   COPY public.proba_company4 (id_proba, name_company, inn_comany, price_uslug, fk_post_met_id) FROM stdin;
    public          postgres    false    224   �a       u          0    16792    product 
   TABLE DATA           B   COPY public.product (id_product, type_product, price) FROM stdin;
    public          postgres    false    218   �a       t          0    16787    sotr 
   TABLE DATA           d   COPY public.sotr (id_sotr, surname, forename, patronymic, position_sotr, parent_id, id) FROM stdin;
    public          postgres    false    217   Mb       |          0    17062    table1 
   TABLE DATA           C   COPY public.table1 (table_id, name_table, fk_table_id) FROM stdin;
    public          postgres    false    225   4c       }          0    17067    table2 
   TABLE DATA           D   COPY public.table2 (table_id, name_table, fl_table1_id) FROM stdin;
    public          postgres    false    226   Qc       ~          0    17077    table3 
   TABLE DATA           D   COPY public.table3 (table_id, name_table, fl_table1_id) FROM stdin;
    public          postgres    false    227   nc       �           2606    16889    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    222            �           2606    16909 "   company_client company_client_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.company_client
    ADD CONSTRAINT company_client_pkey PRIMARY KEY (fk_company_id, fk_client_id);
 L   ALTER TABLE ONLY public.company_client DROP CONSTRAINT company_client_pkey;
       public            postgres    false    221    221            �           2606    16826    company company_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id_company);
 >   ALTER TABLE ONLY public.company DROP CONSTRAINT company_pkey;
       public            postgres    false    220            �           2606    16953    company_tkan company_tkan_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.company_tkan
    ADD CONSTRAINT company_tkan_pkey PRIMARY KEY (company_tkan_id);
 H   ALTER TABLE ONLY public.company_tkan DROP CONSTRAINT company_tkan_pkey;
       public            postgres    false    223            �           2606    16806    materials materials_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id_materials);
 B   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_pkey;
       public            postgres    false    219            �           2606    16781    post_inst post_inst_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.post_inst
    ADD CONSTRAINT post_inst_pkey PRIMARY KEY (post_inst_id);
 B   ALTER TABLE ONLY public.post_inst DROP CONSTRAINT post_inst_pkey;
       public            postgres    false    215            �           2606    16776    post_met post_met_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.post_met
    ADD CONSTRAINT post_met_pkey PRIMARY KEY (post_met_id);
 @   ALTER TABLE ONLY public.post_met DROP CONSTRAINT post_met_pkey;
       public            postgres    false    214            �           2606    16786    post_stan post_stan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.post_stan
    ADD CONSTRAINT post_stan_pkey PRIMARY KEY (post_stan_id);
 B   ALTER TABLE ONLY public.post_stan DROP CONSTRAINT post_stan_pkey;
       public            postgres    false    216            �           2606    17054 "   proba_company4 proba_company4_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.proba_company4
    ADD CONSTRAINT proba_company4_pkey PRIMARY KEY (id_proba);
 L   ALTER TABLE ONLY public.proba_company4 DROP CONSTRAINT proba_company4_pkey;
       public            postgres    false    224            �           2606    16796    product product_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id_product);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    218            �           2606    16791    sotr sotr_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.sotr
    ADD CONSTRAINT sotr_pkey PRIMARY KEY (id_sotr);
 8   ALTER TABLE ONLY public.sotr DROP CONSTRAINT sotr_pkey;
       public            postgres    false    217            �           2606    17066    table1 table1_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.table1
    ADD CONSTRAINT table1_pkey PRIMARY KEY (table_id);
 <   ALTER TABLE ONLY public.table1 DROP CONSTRAINT table1_pkey;
       public            postgres    false    225            �           2606    17071    table2 table2_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.table2
    ADD CONSTRAINT table2_pkey PRIMARY KEY (table_id);
 <   ALTER TABLE ONLY public.table2 DROP CONSTRAINT table2_pkey;
       public            postgres    false    226            �           2606    17081    table3 table3_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.table3
    ADD CONSTRAINT table3_pkey PRIMARY KEY (table_id);
 <   ALTER TABLE ONLY public.table3 DROP CONSTRAINT table3_pkey;
       public            postgres    false    227            �           2606    16880    sotr unique_doljnost 
   CONSTRAINT     X   ALTER TABLE ONLY public.sotr
    ADD CONSTRAINT unique_doljnost UNIQUE (position_sotr);
 >   ALTER TABLE ONLY public.sotr DROP CONSTRAINT unique_doljnost;
       public            postgres    false    217            �           2606    17061    proba_company4 unique_innnn 
   CONSTRAINT     \   ALTER TABLE ONLY public.proba_company4
    ADD CONSTRAINT unique_innnn UNIQUE (inn_comany);
 E   ALTER TABLE ONLY public.proba_company4 DROP CONSTRAINT unique_innnn;
       public            postgres    false    224            �           2606    16874    post_inst unique_name1 
   CONSTRAINT     V   ALTER TABLE ONLY public.post_inst
    ADD CONSTRAINT unique_name1 UNIQUE (name_post);
 @   ALTER TABLE ONLY public.post_inst DROP CONSTRAINT unique_name1;
       public            postgres    false    215            �           2606    16876    post_stan unique_name2 
   CONSTRAINT     V   ALTER TABLE ONLY public.post_stan
    ADD CONSTRAINT unique_name2 UNIQUE (name_post);
 @   ALTER TABLE ONLY public.post_stan DROP CONSTRAINT unique_name2;
       public            postgres    false    216            �           2606    16896    client unique_product 
   CONSTRAINT     Y   ALTER TABLE ONLY public.client
    ADD CONSTRAINT unique_product UNIQUE (fk_product_id);
 ?   ALTER TABLE ONLY public.client DROP CONSTRAINT unique_product;
       public            postgres    false    222            �           2606    16960    company_tkan unique_tkan 
   CONSTRAINT     X   ALTER TABLE ONLY public.company_tkan
    ADD CONSTRAINT unique_tkan UNIQUE (type_tkan);
 B   ALTER TABLE ONLY public.company_tkan DROP CONSTRAINT unique_tkan;
       public            postgres    false    223            �           1259    17112    idx1    INDEX     W   CREATE INDEX idx1 ON public.client USING btree (surname, profit) WHERE (profit > 999);
    DROP INDEX public.idx1;
       public            postgres    false    222    222    222            �           1259    17113    indx2    INDEX     F   CREATE UNIQUE INDEX indx2 ON public.allsotr USING btree (patronymic);
    DROP INDEX public.indx2;
       public            postgres    false    229            �           1259    17114    indx3    INDEX     M   CREATE INDEX indx3 ON public.product USING btree (type_product, price DESC);
    DROP INDEX public.indx3;
       public            postgres    false    218    218            �           2606    16890     client client_fk_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_fk_product_id_fkey FOREIGN KEY (fk_product_id) REFERENCES public.product(id_product);
 J   ALTER TABLE ONLY public.client DROP CONSTRAINT client_fk_product_id_fkey;
       public          postgres    false    218    3254    222            �           2606    16898 /   company_client company_client_fk_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_client
    ADD CONSTRAINT company_client_fk_client_id_fkey FOREIGN KEY (fk_client_id) REFERENCES public.client(id_client);
 Y   ALTER TABLE ONLY public.company_client DROP CONSTRAINT company_client_fk_client_id_fkey;
       public          postgres    false    222    3262    221            �           2606    16903 0   company_client company_client_fk_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_client
    ADD CONSTRAINT company_client_fk_company_id_fkey FOREIGN KEY (fk_company_id) REFERENCES public.company(id_company);
 Z   ALTER TABLE ONLY public.company_client DROP CONSTRAINT company_client_fk_company_id_fkey;
       public          postgres    false    3258    221    220            �           2606    16827 $   company company_fk_materials_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_fk_materials_id_fkey FOREIGN KEY (fk_materials_id) REFERENCES public.materials(id_materials);
 N   ALTER TABLE ONLY public.company DROP CONSTRAINT company_fk_materials_id_fkey;
       public          postgres    false    219    3256    220            �           2606    16837 "   company company_fk_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_fk_product_id_fkey FOREIGN KEY (fk_product_id) REFERENCES public.product(id_product);
 L   ALTER TABLE ONLY public.company DROP CONSTRAINT company_fk_product_id_fkey;
       public          postgres    false    220    218    3254            �           2606    16832    company company_fk_sotr_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_fk_sotr_id_fkey FOREIGN KEY (fk_sotr_id) REFERENCES public.sotr(id_sotr);
 I   ALTER TABLE ONLY public.company DROP CONSTRAINT company_fk_sotr_id_fkey;
       public          postgres    false    217    220    3249            �           2606    16954 6   company_tkan company_tkan_fk_copmany_post_stan_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_tkan
    ADD CONSTRAINT company_tkan_fk_copmany_post_stan_id_fkey FOREIGN KEY (fk_copmany_post_stan_id) REFERENCES public.post_stan(post_stan_id);
 `   ALTER TABLE ONLY public.company_tkan DROP CONSTRAINT company_tkan_fk_copmany_post_stan_id_fkey;
       public          postgres    false    216    3245    223            �           2606    16812 (   materials materials_fk_post_inst_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_fk_post_inst_id_fkey FOREIGN KEY (fk_post_inst_id) REFERENCES public.post_inst(post_inst_id);
 R   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_fk_post_inst_id_fkey;
       public          postgres    false    3241    215    219            �           2606    16807 '   materials materials_fk_post_met_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_fk_post_met_id_fkey FOREIGN KEY (fk_post_met_id) REFERENCES public.post_met(post_met_id);
 Q   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_fk_post_met_id_fkey;
       public          postgres    false    214    3239    219            �           2606    16817 (   materials materials_fk_post_stan_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_fk_post_stan_id_fkey FOREIGN KEY (fk_post_stan_id) REFERENCES public.post_stan(post_stan_id);
 R   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_fk_post_stan_id_fkey;
       public          postgres    false    219    3245    216            �           2606    16961 (   materials materials_fk_type_tkan_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_fk_type_tkan_id_fkey FOREIGN KEY (fk_type_tkan_id) REFERENCES public.company_tkan(type_tkan);
 R   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_fk_type_tkan_id_fkey;
       public          postgres    false    3269    223    219            �           2606    17055 1   proba_company4 proba_company4_fk_post_met_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.proba_company4
    ADD CONSTRAINT proba_company4_fk_post_met_id_fkey FOREIGN KEY (fk_post_met_id) REFERENCES public.post_stan(post_stan_id);
 [   ALTER TABLE ONLY public.proba_company4 DROP CONSTRAINT proba_company4_fk_post_met_id_fkey;
       public          postgres    false    3245    224    216            �           2606    17087    table1 table1_fk_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.table1
    ADD CONSTRAINT table1_fk_table_id_fkey FOREIGN KEY (fk_table_id) REFERENCES public.table3(table_id);
 H   ALTER TABLE ONLY public.table1 DROP CONSTRAINT table1_fk_table_id_fkey;
       public          postgres    false    225    3279    227            �           2606    17072    table2 table2_fl_table1_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.table2
    ADD CONSTRAINT table2_fl_table1_id_fkey FOREIGN KEY (fl_table1_id) REFERENCES public.table1(table_id);
 I   ALTER TABLE ONLY public.table2 DROP CONSTRAINT table2_fl_table1_id_fkey;
       public          postgres    false    226    225    3275            �           2606    17082    table3 table3_fl_table1_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.table3
    ADD CONSTRAINT table3_fl_table1_id_fkey FOREIGN KEY (fl_table1_id) REFERENCES public.table2(table_id);
 I   ALTER TABLE ONLY public.table3 DROP CONSTRAINT table3_fl_table1_id_fkey;
       public          postgres    false    226    227    3277                       0    17096    allsotr    MATERIALIZED VIEW DATA     *   REFRESH MATERIALIZED VIEW public.allsotr;
          public          postgres    false    229    3457            y   �   x�=�;�0D��)|���߅��)�-%,�$
W߈��bW��{�@V�ʁ��<1�ɾ�>x�|9+��Þ�������g��;�e�U�1��P-�Z��S}�P��gE&�&�R%g���i��3�|I�`�      w   ;   x�3�4Ë�v�)\���bǅ]v\�{a�-z
�\F��O�1'�S���� d�2�      x      x�3�4�2�4�2�4����� A      z   l   x�����@�*��e �^\�������xAs�@��hF�
_�5q=�:���&��eg��'�]QJQ���]R͞����K���|�OT��?sJ�o��o�j�      v   @   x�3�4�+.l����..#N�0�¶;.��xa�1'^�u��b3Pb�M�q��qqq �*�      r   �   x�=��	�@����H!?h/#���y�b���Ť�َ�ėXf��\��Z+,�S[����ഢx�3)�N�)Mp��Gx|��&��,�g����W���@oO�G/z+6�6���$�cD�֔�f}���cr�YS1\�'5���a.|o�1��{�q      q   �   x�]�A
�0D��)z����^��Ԋ;�QT� j[����o�$R!�?��L� 5F<�F/����1F9�*%+�<ÕB�<Y�0�E���Y���
��W֔��q�&���q�^e���L�3����Q�HO̲,uA�4)�1��8x��e,���M�=��j�e�E��� �	��      s   �   x�eP;N�@�gO���Ʋ%_ \ %Mi)"��A	� $h�|ǎ7Wxs#�m$��v����X��O�p���;����Z_p�t�s�����M�Dh∴�G4� u�J���P�"'6�Uk�G�Ƒ��M_��f�����RW�7J)��{$���Q�������<i~��z��a^�T�&���q���~<	�h����g�+}�V�va����#9z�<g����u2�8_)[E���S8?��+M�ul��*�      {      x������ � �      u   b   x�%˻� ����^�b1bb�2��R�ґ�m��g"޺�@A���<[Rb�W�q#�VJ�#��'	&�S�g�PBV~E���g�E�7]      t   �   x�]O9�@����HIx/�1BP �@���r	�@�/��xA�(�^��q&X�D@��R��D���Zǂ=���u���s���G*1W�7[h��錍�nm�q����#nGb�h�]r)\!ؘr�A�"d\�$�*�?����Nq�$#���z�$w�����i<�l�d��P�f��כ|��Ssd�f����v�)ˠ/�t�sO����      |      x������ � �      }      x������ � �      ~      x������ � �     