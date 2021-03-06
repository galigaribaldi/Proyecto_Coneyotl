PGDMP         :                x           d5uhjf5jth5qko     12.3 (Ubuntu 12.3-1.pgdg16.04+1)    12.2     6           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            7           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            8           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            9           1262    25985320    d5uhjf5jth5qko    DATABASE     �   CREATE DATABASE d5uhjf5jth5qko WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE d5uhjf5jth5qko;
                dzmfrgrrkgatqc    false            :           0    0    DATABASE d5uhjf5jth5qko    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE d5uhjf5jth5qko FROM PUBLIC;
                   dzmfrgrrkgatqc    false    3897            ;           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO dzmfrgrrkgatqc;
                   postgres    false    678            �            1259    30701746    promedio    TABLE     Q  CREATE TABLE public.promedio (
    promedio_id integer NOT NULL,
    estudiante_id integer NOT NULL,
    grado character varying(5),
    promedio_b1 numeric(4,2) DEFAULT 0,
    promedio_b2 numeric(4,2) DEFAULT 0,
    promedio_b3 numeric(4,2) DEFAULT 0,
    promedio_b4 numeric(4,2) DEFAULT 0,
    promedio_toal numeric(4,2) DEFAULT 0
);
    DROP TABLE public.promedio;
       public         heap    dzmfrgrrkgatqc    false            �            1259    30701744    promedio_promedio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promedio_promedio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.promedio_promedio_id_seq;
       public          dzmfrgrrkgatqc    false    222            <           0    0    promedio_promedio_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.promedio_promedio_id_seq OWNED BY public.promedio.promedio_id;
          public          dzmfrgrrkgatqc    false    221            �           2604    30701749    promedio promedio_id    DEFAULT     |   ALTER TABLE ONLY public.promedio ALTER COLUMN promedio_id SET DEFAULT nextval('public.promedio_promedio_id_seq'::regclass);
 C   ALTER TABLE public.promedio ALTER COLUMN promedio_id DROP DEFAULT;
       public          dzmfrgrrkgatqc    false    221    222    222            3          0    30701746    promedio 
   TABLE DATA           �   COPY public.promedio (promedio_id, estudiante_id, grado, promedio_b1, promedio_b2, promedio_b3, promedio_b4, promedio_toal) FROM stdin;
    public          dzmfrgrrkgatqc    false    222   �       =           0    0    promedio_promedio_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.promedio_promedio_id_seq', 133, true);
          public          dzmfrgrrkgatqc    false    221            �           2606    30701756    promedio promedio_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.promedio
    ADD CONSTRAINT promedio_pkey PRIMARY KEY (promedio_id);
 @   ALTER TABLE ONLY public.promedio DROP CONSTRAINT promedio_pkey;
       public            dzmfrgrrkgatqc    false    222            �           2606    30701757    promedio estudiante_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.promedio
    ADD CONSTRAINT estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(estudiante_id);
 E   ALTER TABLE ONLY public.promedio DROP CONSTRAINT estudiante_id_fkey;
       public          dzmfrgrrkgatqc    false    222            3   �  x�mXK�$7[�S����3���~� �GHʪ~A2O�j�,Q%�U��}�߿?�9�9�m|�e>����j�__���+?��g{�`��}-�>������E�V?�Z9O�Z�^��&\[��L,8ß���Jo�jӫ��C�����y4t�g(��xƀ�MC;��p6w��ѵIO��d$��w��O��w�4�բcX o�
� {����yQ��������M��R,�dJ
Ý|e�2�k�?d�~��YJ���/C��8�~�lYL3b�%!��l7x�e0��HX:;`�E��Z6=�|>a>8����,�	��(�>��l���I�v��H'�qّ��<͏�^���8{ђ��G V�����7�B�w������
�5�4g0p�2y�:7�������$� �`D�b��-%ڷ�b )��N��	��A 5U�f����0:Y�禊9�����Y�A0
���έ>.���*Q��V9R�u3�U�NҜV6��\ތ��H�ZA�ۭ�N�5n�<o j�(@ Q��ߚ�^1����bJNP�U%@�����t1��,#�ҍ�R�m#�p�J\7�T����x&e&�8T�C怂��
���9�lg��������|x�#���
G���;K�9���J-���}N��9�|�>�]t�=�LI�����
�<��-)�ȠF��4d�Ղp@@�ѓ�s��׵��l�'%����쵋�JTD�b��)`b^�\��[����P��j*�c!���K��-�KFdAeEu0���V��t�{��Z=�'���	(��RjHS�[F[/���j\(U�j�^�
�@��G���j���%��MQ��:�X���KUX�ov�B���S/�~C?������z�Ԋ���^>q2�O�%/��#���U�s��@�Y����+�z��L�0"tR|���G/M ���^��*��mم�^(�*NKǲ����
�/"������$T=>��\�Oe�-��Z\э{��tL�Qj�)�B�G�X2@B&��>�Z��OU%2�d©)I��71BΜ����E`&{�I�R;�- q
xe��:�p���Dş�����V����4Oqu!�H�TsS��!&�?)��,��u��0|w��s��-͡�K����c�B��]���+���9O&ؤ�L1�+P��R�NoehdI�$o{Dחw���%P3��̬r�E���t��M���V�oӚ�tH̪���'R��!5����m�ӈ�[+TA0�(�|�1��L�/	6��鹿\I2e�<L��*��]5��`s�Pv18�GL4Dt��c�m���X.1��->b
�&�a�V����hv�//c<�&z�z�i��]��Y�B���E��{Ov�v'����#�`��
��B����Nj+�ELR�r��15D��7wJŀ2iX��P̠*���.z�3z�~W棾͠���M�;�B\"��L��<��|�j�g��@�HO9�߆A� Ȭ�j;�*ŮFU=�m�nw���3o�6y�d�����Yfj�j�sUnO�GJ����OW��dI�r����]�S`���W��埃C-��6�m�-����s!�d-u.<�2͋�f�ũ��<�aI73��*����;���ȾU";��I.����N�h�����{k���f�޾C�N�2>y� �$��b�-�q�R���D͝�yV����y��nA͞щ�y ��u!jO=��P�tym����q�J[E���t/5(�����8=Z�/bN#}�;5l5�v7�'��vp����r��/֩���o�Ps�?&'����~�895�?c���j�T\��%�R��8�I���Te�����Ł�S1�Nhp�ӹ�j��������D4��_�r����`��Z�J��R�ج��h��#��&�Ϟ9��,�A)�\Բ���k�FGX�ԯ���<�s�޳�?�R�?>Q	     