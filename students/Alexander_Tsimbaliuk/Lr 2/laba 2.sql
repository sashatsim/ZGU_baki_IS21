PGDMP     -    :                {            laba_1    15.2    15.2 ,    A           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            B           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            C           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            D           1262    16771    laba_1    DATABASE     z   CREATE DATABASE laba_1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE laba_1;
                postgres    false            �            1259    16885    client    TABLE     �   CREATE TABLE public.client (
    id_client integer NOT NULL,
    fk_product_id integer,
    profit integer NOT NULL,
    adress character varying(64) NOT NULL,
    CONSTRAINT client_profit_check CHECK ((profit > 0))
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16822    company    TABLE     �   CREATE TABLE public.company (
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
       public         heap    postgres    false            �            1259    16802 	   materials    TABLE     �   CREATE TABLE public.materials (
    id_materials integer NOT NULL,
    fk_post_met_id integer,
    fk_post_inst_id integer,
    fk_post_stan_id integer
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
       public         heap    postgres    false            �            1259    16772    post_met    TABLE     C   CREATE TABLE public.post_met (
    post_met_id integer NOT NULL
);
    DROP TABLE public.post_met;
       public         heap    postgres    false            �            1259    16782 	   post_stan    TABLE       CREATE TABLE public.post_stan (
    post_stan_id integer NOT NULL,
    name_post character varying(64) NOT NULL,
    type_material character varying(64) NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL,
    adress character varying(64) NOT NULL
);
    DROP TABLE public.post_stan;
       public         heap    postgres    false            �            1259    16792    product    TABLE     �   CREATE TABLE public.product (
    id_product integer NOT NULL,
    type_product character varying(64) NOT NULL,
    price integer NOT NULL
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16787    sotr    TABLE     �   CREATE TABLE public.sotr (
    id_sotr integer NOT NULL,
    surname character varying(64) NOT NULL,
    forename character varying(64) NOT NULL,
    patronymic character varying(64) NOT NULL,
    position_sotr character varying(64) NOT NULL
);
    DROP TABLE public.sotr;
       public         heap    postgres    false            >          0    16885    client 
   TABLE DATA           J   COPY public.client (id_client, fk_product_id, profit, adress) FROM stdin;
    public          postgres    false    222   6       <          0    16822    company 
   TABLE DATA           a   COPY public.company (id_company, fk_materials_id, fk_sotr_id, fk_product_id, adress) FROM stdin;
    public          postgres    false    220   /6       =          0    16882    company_client 
   TABLE DATA           E   COPY public.company_client (fk_company_id, fk_client_id) FROM stdin;
    public          postgres    false    221   L6       ;          0    16802 	   materials 
   TABLE DATA           c   COPY public.materials (id_materials, fk_post_met_id, fk_post_inst_id, fk_post_stan_id) FROM stdin;
    public          postgres    false    219   i6       7          0    16777 	   post_inst 
   TABLE DATA           d   COPY public.post_inst (post_inst_id, name_post, type_material, quantity, price, adress) FROM stdin;
    public          postgres    false    215   �6       6          0    16772    post_met 
   TABLE DATA           /   COPY public.post_met (post_met_id) FROM stdin;
    public          postgres    false    214   �6       8          0    16782 	   post_stan 
   TABLE DATA           d   COPY public.post_stan (post_stan_id, name_post, type_material, quantity, price, adress) FROM stdin;
    public          postgres    false    216   �6       :          0    16792    product 
   TABLE DATA           B   COPY public.product (id_product, type_product, price) FROM stdin;
    public          postgres    false    218   �6       9          0    16787    sotr 
   TABLE DATA           U   COPY public.sotr (id_sotr, surname, forename, patronymic, position_sotr) FROM stdin;
    public          postgres    false    217   �6       �           2606    16889    client client_pkey 
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
       public            postgres    false    220            �           2606    16806    materials materials_pkey 
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
       public            postgres    false    216            �           2606    16796    product product_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id_product);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    218            �           2606    16791    sotr sotr_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.sotr
    ADD CONSTRAINT sotr_pkey PRIMARY KEY (id_sotr);
 8   ALTER TABLE ONLY public.sotr DROP CONSTRAINT sotr_pkey;
       public            postgres    false    217            �           2606    16880    sotr unique_doljnost 
   CONSTRAINT     X   ALTER TABLE ONLY public.sotr
    ADD CONSTRAINT unique_doljnost UNIQUE (position_sotr);
 >   ALTER TABLE ONLY public.sotr DROP CONSTRAINT unique_doljnost;
       public            postgres    false    217            �           2606    16874    post_inst unique_name1 
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
       public            postgres    false    222            �           2606    16890     client client_fk_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_fk_product_id_fkey FOREIGN KEY (fk_product_id) REFERENCES public.product(id_product);
 J   ALTER TABLE ONLY public.client DROP CONSTRAINT client_fk_product_id_fkey;
       public          postgres    false    218    222    3220            �           2606    16898 /   company_client company_client_fk_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_client
    ADD CONSTRAINT company_client_fk_client_id_fkey FOREIGN KEY (fk_client_id) REFERENCES public.client(id_client);
 Y   ALTER TABLE ONLY public.company_client DROP CONSTRAINT company_client_fk_client_id_fkey;
       public          postgres    false    222    221    3228            �           2606    16903 0   company_client company_client_fk_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_client
    ADD CONSTRAINT company_client_fk_company_id_fkey FOREIGN KEY (fk_company_id) REFERENCES public.company(id_company);
 Z   ALTER TABLE ONLY public.company_client DROP CONSTRAINT company_client_fk_company_id_fkey;
       public          postgres    false    221    220    3224            �           2606    16827 $   company company_fk_materials_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_fk_materials_id_fkey FOREIGN KEY (fk_materials_id) REFERENCES public.materials(id_materials);
 N   ALTER TABLE ONLY public.company DROP CONSTRAINT company_fk_materials_id_fkey;
       public          postgres    false    219    3222    220            �           2606    16837 "   company company_fk_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_fk_product_id_fkey FOREIGN KEY (fk_product_id) REFERENCES public.product(id_product);
 L   ALTER TABLE ONLY public.company DROP CONSTRAINT company_fk_product_id_fkey;
       public          postgres    false    218    3220    220            �           2606    16832    company company_fk_sotr_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_fk_sotr_id_fkey FOREIGN KEY (fk_sotr_id) REFERENCES public.sotr(id_sotr);
 I   ALTER TABLE ONLY public.company DROP CONSTRAINT company_fk_sotr_id_fkey;
       public          postgres    false    217    3216    220            �           2606    16812 (   materials materials_fk_post_inst_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_fk_post_inst_id_fkey FOREIGN KEY (fk_post_inst_id) REFERENCES public.post_inst(post_inst_id);
 R   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_fk_post_inst_id_fkey;
       public          postgres    false    3208    219    215            �           2606    16807 '   materials materials_fk_post_met_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_fk_post_met_id_fkey FOREIGN KEY (fk_post_met_id) REFERENCES public.post_met(post_met_id);
 Q   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_fk_post_met_id_fkey;
       public          postgres    false    219    3206    214            �           2606    16817 (   materials materials_fk_post_stan_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_fk_post_stan_id_fkey FOREIGN KEY (fk_post_stan_id) REFERENCES public.post_stan(post_stan_id);
 R   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_fk_post_stan_id_fkey;
       public          postgres    false    219    216    3212            >      x������ � �      <      x������ � �      =      x������ � �      ;      x������ � �      7      x������ � �      6      x������ � �      8      x������ � �      :      x������ � �      9      x������ � �     