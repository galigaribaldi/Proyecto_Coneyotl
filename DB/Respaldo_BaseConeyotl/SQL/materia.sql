PGDMP     6    8                x           d5uhjf5jth5qko     12.3 (Ubuntu 12.3-1.pgdg16.04+1)    12.2 	    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            2           1262    25985320    d5uhjf5jth5qko    DATABASE     �   CREATE DATABASE d5uhjf5jth5qko WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE d5uhjf5jth5qko;
                dzmfrgrrkgatqc    false            3           0    0    DATABASE d5uhjf5jth5qko    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE d5uhjf5jth5qko FROM PUBLIC;
                   dzmfrgrrkgatqc    false    3890            4           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO dzmfrgrrkgatqc;
                   postgres    false    678            �            1259    25997760    materia    TABLE       CREATE TABLE public.materia (
    materia_id integer NOT NULL,
    nombre character varying(90) NOT NULL,
    estado character(2),
    grado character varying(5),
    CONSTRAINT estado_ck CHECK ((estado = ANY (ARRAY['A'::bpchar, 'S'::bpchar, 'B'::bpchar])))
);
    DROP TABLE public.materia;
       public         heap    dzmfrgrrkgatqc    false            ,          0    25997760    materia 
   TABLE DATA           D   COPY public.materia (materia_id, nombre, estado, grado) FROM stdin;
    public          dzmfrgrrkgatqc    false    205   �       �           2606    25997765    materia materia_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.materia
    ADD CONSTRAINT materia_pkey PRIMARY KEY (materia_id);
 >   ALTER TABLE ONLY public.materia DROP CONSTRAINT materia_pkey;
       public            dzmfrgrrkgatqc    false    205            ,   1  x���=��0�k�<����]�0+��~�] M�I�pr��[l�H�XK����!���l:�F���ԋ��?��ԽV�(��W�	��M���Y�V�J���Zt�~w�0�I�|:W��-7;7�l|[ʊ�ޥ�Zt}#*
��P��m�2�t��Nʘ,�i�����t���~L�Q�hg�k\��)���2��r[�\N
s9��k2�5�d%Z�r�ws�-f.'�L�S5�z�·���`d{�s{
��Rc6N,h`Ѣ��>���q�3�R̤�h��Uo[�3^�n��IA�C��}�����{v62��3�bU�EXȬ�B����	">�l�;wr���&=^���I�_��1
�(D��NA��䒾F��_��`��u1;�"�j�˪~`� ��.@v�Rٳ�4�F�jO?���L�P��^-���Z2�f���F���k����`-�/��С���2�%�j>�~-`k��Z@��R-�jjq�]-�Ҋ������?���6��$����F�p�N7OD������ �t�~z�l6� 3�W�     