PGDMP         7                x           d5uhjf5jth5qko     12.3 (Ubuntu 12.3-1.pgdg16.04+1)    12.2     J           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            K           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            L           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            M           1262    25985320    d5uhjf5jth5qko    DATABASE     �   CREATE DATABASE d5uhjf5jth5qko WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE d5uhjf5jth5qko;
                dzmfrgrrkgatqc    false            N           0    0    DATABASE d5uhjf5jth5qko    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE d5uhjf5jth5qko FROM PUBLIC;
                   dzmfrgrrkgatqc    false    3917            O           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO dzmfrgrrkgatqc;
                   postgres    false    678            �            1259    25997766    inscripcion_grado    TABLE     ^  CREATE TABLE public.inscripcion_grado (
    estudiante_id integer NOT NULL,
    materia_id integer NOT NULL,
    profesor_id integer NOT NULL,
    calificacion_b1 numeric(4,2) DEFAULT 0,
    campo1_b1 numeric(4,2) DEFAULT 0,
    campo2_b1 numeric(4,2) DEFAULT 0,
    campo3_b1 numeric(4,2) DEFAULT 0,
    campo4_b1 numeric(4,2) DEFAULT 0,
    campo5_b1 numeric(4,2) DEFAULT 0,
    calificacion_b2 numeric(4,2) DEFAULT 0,
    campo1_b2 numeric(4,2) DEFAULT 0,
    campo2_b2 numeric(4,2) DEFAULT 0,
    campo3_b2 numeric(4,2) DEFAULT 0,
    campo4_b2 numeric(4,2) DEFAULT 0,
    campo5_b2 numeric(4,2) DEFAULT 0,
    calificacion_b3 numeric(4,2) DEFAULT 0,
    campo1_b3 numeric(4,2) DEFAULT 0,
    campo2_b3 numeric(4,2) DEFAULT 0,
    campo3_b3 numeric(4,2) DEFAULT 0,
    campo4_b3 numeric(4,2) DEFAULT 0,
    campo5_b3 numeric(4,2) DEFAULT 0,
    calificacion_b4 numeric(4,2) DEFAULT 0,
    campo1_b4 numeric(4,2) DEFAULT 0,
    campo2_b4 numeric(4,2) DEFAULT 0,
    campo3_b4 numeric(4,2) DEFAULT 0,
    campo4_b4 numeric(4,2) DEFAULT 0,
    campo5_b4 numeric(4,2) DEFAULT 0,
    promedio numeric(4,2) DEFAULT 0
);
 %   DROP TABLE public.inscripcion_grado;
       public         heap    dzmfrgrrkgatqc    false            G          0    25997766    inscripcion_grado 
   TABLE DATA           }  COPY public.inscripcion_grado (estudiante_id, materia_id, profesor_id, calificacion_b1, campo1_b1, campo2_b1, campo3_b1, campo4_b1, campo5_b1, calificacion_b2, campo1_b2, campo2_b2, campo3_b2, campo4_b2, campo5_b2, calificacion_b3, campo1_b3, campo2_b3, campo3_b3, campo4_b3, campo5_b3, calificacion_b4, campo1_b4, campo2_b4, campo3_b4, campo4_b4, campo5_b4, promedio) FROM stdin;
    public          dzmfrgrrkgatqc    false    206   ?       �           2606    25997795 (   inscripcion_grado inscripcion_grado_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.inscripcion_grado
    ADD CONSTRAINT inscripcion_grado_pkey PRIMARY KEY (estudiante_id, materia_id, profesor_id);
 R   ALTER TABLE ONLY public.inscripcion_grado DROP CONSTRAINT inscripcion_grado_pkey;
       public            dzmfrgrrkgatqc    false    206    206    206            �           2606    25997796 6   inscripcion_grado inscripcion_grado_estudiante_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inscripcion_grado
    ADD CONSTRAINT inscripcion_grado_estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(estudiante_id);
 `   ALTER TABLE ONLY public.inscripcion_grado DROP CONSTRAINT inscripcion_grado_estudiante_id_fkey;
       public          dzmfrgrrkgatqc    false    206            �           2606    25997801 3   inscripcion_grado inscripcion_grado_materia_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inscripcion_grado
    ADD CONSTRAINT inscripcion_grado_materia_id_fkey FOREIGN KEY (materia_id) REFERENCES public.materia(materia_id);
 ]   ALTER TABLE ONLY public.inscripcion_grado DROP CONSTRAINT inscripcion_grado_materia_id_fkey;
       public          dzmfrgrrkgatqc    false    206            �           2606    25997806 4   inscripcion_grado inscripcion_grado_profesor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inscripcion_grado
    ADD CONSTRAINT inscripcion_grado_profesor_id_fkey FOREIGN KEY (profesor_id) REFERENCES public.profesor_grado(profesor_id);
 ^   ALTER TABLE ONLY public.inscripcion_grado DROP CONSTRAINT inscripcion_grado_profesor_id_fkey;
       public          dzmfrgrrkgatqc    false    206            G      x��=Y�㪮߹��ez�˛�8�=� ��|+��Ĳ��)?�0�aǿ��õ,�;��?vH~�fO��?�>��Hw��(���c�1q^6������yI}��]cO��2�r��>�d�O�p�c��˨�Xv`�eJ�@1��x��A��=|�}�:�P��n�R�gqT��]�~���oЁ�4�m�����c/SyМm���%��5���Jg"n\ʣ(**X?~Z����jp��_����͂�m��#n��������:�'�i�Y�q
�ZY��n��&�+<�8b���i�!�#G��y������=*���y���:������1���M'k�����N��I�3�'��M�&��ܤnp��3���	�iο^q�:9ja��~�.$�}H��
���_QlM=����,�pԞ��}����R�
(�"c	�9݃S�)�<���ٛ�e&g��VMk�� �X�K1*l��yz��Q��#��X��}�C��Zot6�D�<�暯��2��=g!�1vO�?��;���0%��R�T�FBU�9a]��dl4��B��V��h8!�M!��3���2�<m�MJ��7��U87��
|�o�����vHzO �B��M6����KW����#�Up����M�A�&���~Uy	D�\J�
�>����Q���~��׻h#�J~l�k�#��k�ĕI�������� �o��V ��Dj�}�W���V(3��6-bِ�c��OY1S�+��P�0��l��֑R=L~��i��8|/��k�f�o��}�)���-	�#p��Þ\��K��[�
���s
�Ϥ���C���_r.?�sRK=����=@�?d ��$�[hU�^6j��x\px�&x@�ퟱZ���4��(����*T�µzܢ�Ͽ���UV�>� :_�{�_����6b�z��-nqR�*���!9p��-��c�G��T�����} )�5���+3W���M79 g?)s��b�����Aф�]|r�-����&�V���x���>�ra,U����ƥ��Id�kƳ7ht��
��X̠�[��@&�4ƛ�"��fd���ʣ�P�w�	��eP�M��1�d8s�̊+w<D��Cb�2g�v"g_��¢��x�;��]�Ҏsq%F~gK-�=�z����+L+�7��
�D�_����J��߿�����T�v��ƎQ��u��4�81��Gߊ8#�GX�s���Y��O��ﲼw\ݯz�Gʌ���$CP�8�Y����@�G20ߥb���e�n�h��7{��[���X��t��&T۫ӧY���PZ��G�N�FN�8���O�?`@��N#�ׯ�N;�M2ܓ3��&/4gq��K�D����R��)��~�q��{v5��7���yW�����p���85u醋�S1�����8D�^�����#O�H��~�Un�@���Օ* *���|ř����8�@CH��P�(�u�����Y0�Y:���i�U,5�N��i�Ĺ�Vã`צO�Ųrl�`��h�)��8�P2�+5��c��qҥ�]JcL�,*Ty��s������U��"eت�NZڜ�����������olh�J�ı��Ҽ�	9�Tn�4Vk��P5��	DC>DǮ����X%�� ��G�p��0��ן�˓�n^����}A���pu�Ðz�����pM/�ҋ��x.ʾ�:������r�lq��E�k�E�g﮴��Gl���T�*�˴H�ܐ\/��u���(�L��\BB���hX�FR��0D8.~�)� Z�c_FZ�cչp��Jer����#�Q�\���M��Vf�g-��40uڌy��ZW>tN 黇���f���>� ���q��ƶ\���dD�i�ti�y��C�?@dc���8����\ �_�y�"�ҥ|ab��C�]���2���&���Y��DA
� �������& �ެ"B���V�C�K_�p�[`x����-�>:d|]Rs�l��J���eyk��6D�:�5Y�V8~���~��{+q�����y�����5�������ax���n�[(��tO݀���D�Bw�0�bF�'���)�]*��n����b�Cu�++��M&I*t����ypq`ף�Xx֨���q�kz1���l����7���9A's��d�����'��m��!�b�em+���h�+�>kH:ў�rL�q}ǱŜ���g�� S�n��[ȫ�J�n�3�؞��Ze�����,vl�!n$"��XknP(�i���ML�b�I�9���ŗ{h�U�c����诓��E2*߱:��`"4��G�l�wH��I�M��7L���d �ʯ?��?�p�)ט?�������]ѭ,���������fn��r�1E�-�=���"�&�H�j.����.{�U-������Z}4�;&Z���}�/pSB7��E�Oc�V>mAS��U:�B|�/xH�� �t�:jBޥ�uz�9G�гQ� �y�4j��AUj�+ۗO�d���Gf����ٲ��)��?�G�i�Z����v?Ay��E�=-�i�NZ>zM�����54PC8��\�y˸1�u�U>���{����vQ��a�a�H4��'h�ٻf�/NI���i��;9���gO��)/��F\-����}hR�K�PMێ��������2SP;�P���y�#�+��Ĥ�ř@����"�;_���Y?r0�H[��l����''��$0���4T�޾ZJ�M�\�^g��w�(F�| /��w�Ͽ�xY[H��x�|�GDl�{�F��$eȗoI]���=� *��KN<.X�:@�[��ߐEP����Z�p�v(&�ی�h˫C|��!�{8N���ԇ芏E(���UP��_���6@�]6V�Ϯ&Fa��6�9,��
���4]f|���f��.W�F����\��M�G>"L� j͜[iy:��\�X�ߣ���)�Ѧ�^�B���^7�X�b������ Ƽ��k�d�kf����}O']�l�u��,$t@2X,��YVM���
�4rW�ۙ��������.8$�dg� ؏�@�Z�u��V|O䄼E?�P� �1m��k��.n>ngvu��NE0�w��Y����0��\p�{��;ʙ����3��H��<��v �G�f�pb�nؐ���j&?�Ax)`'MH_��ǘ�W`W� ��j�D��Б9�'I�O�3�Dܟt§�b�K� q�s 7�3L��g/%��
��?H��hp��M
(R�>��4�/ ��Y y@`��%��\���(����ќ����2-��~���&���ݜD��j�%����RN����3����k��6�j�l&�� ��Z���| ae{ҳL�=y��l�_#���&|#����s��--8W��H���\�`�"ن�N�;Jx��\���0��9���V�֩k��d���r���5<�D@*6�La����'��ޡS�����n��ix~�Rw�Ø���)7Sy=q�����ޛ�_�>A�z�0��j]� �#VS�s�WX��5�i�tN|�K��{�����!^(8vXp|,s���x:�����Eۄ���L����̧�̏n����Ԫ��WAv�K���1q���G�#o���g�AzW���V�S*ϐҾs��4-do�u����|*���T��]֒$k��$��4��:t^�kl�%QS"_�<�,�'J�aRI�ç숣&������W	������,��1�B�*����a�M �������,	����]8\�eW>�le��FPO'��H��GO��i��ס'Ƹ��W�1:)�d,�5��wU���Ǐ�z�~7Y$~dd�d?�#�ˇ�Av�-�]��I���+�'�$K�h}p�jO���ρ�;6.�I��	�O��y�Q���(��E� c3�8Ԭ�tjD�qbq'��,�80�S�����8$�!�{>r��j�'�bF?)������;��%/ŊOh|���oD��Ά��"�G�R�f�D�����مLG(�����d�o�W�[2lJG�Y7�i��77���;A2    w8h���<���8�~+�sI�31�g��}��c�^��+��p|=�cÒ����5U]Й�W��rOB%�q���V�S�퓱Ō-@<�ʅ�D�s`Ԡ�fm��T"�$����=RtOE2�̀�¡����,V�W���u�m�z��$q�)-�ɔ�J�2����>.8F�����ζj��5���I8��Ս�K�Ϊ�F���g���=l����ĝV�uѤ�B�r��PV޺O4>G����a�tu���R����2_�s�hb/#Wg�7�¯|$S��p5>�<�Ԗl�9{`��p��8�?����[��[�������h�����r�^�H���X��M$�D	�������Jt�&'�`@��
ݹ�Q�\���GG�٘�<�J@F�1�~x��w�����Q��*֜.�e��mO��棾��� �P!��j=bT��y����m��"�Z�����1�Α9��F����;�L�h�?�%����DI*�r���Ju���H���%���1�^Vl�9�c�Q~"�)�*�����&��_�zGC,���Gvp��*PvEs�g*���򸂘��p$z��=};�1j��fM6�S�:ۿb˲#���\	 ����0������+FAG��f�9�x>6�r��MW���Z�Y~�vTg�\D�v�o'SJ��D�ȣ�l3"7�\y`� 1��`�	h��Uv��L-r5�c�K�j��=T];-�"�����W���UH��O,�t$��O�.l����Lė��JbsIK����(9�uW%]DV�Gm{LI9���H)]ߩʾY����ɵ�j��7�Dߦ���B�5���):�:hh!;b*�Sk�!G <!ڑ�l_�<�Ec@�j���C�
(t6R(���
Cϣ?}�%���0�Y^4�Yt��^�O7$���9H��r�q7ʷi!��%jĸ1K�@���gWV�:oj�ʬ����|Ńi��E���:>6�K�Vg[�?bfc#To�T�G:w��Uj��)ܰ�m�ͣ,��a��� (8xF5g����\'��=���#�'������f=�a?����;�4�{���q3���W���H����`"��u]G�!�lܨ�3�)�9?���
���T�:*۾�����K֓��=��S	�`���5V�Go�F����H���M>T�H��jbJߙI���=�\�5p�Bv5��5�\�J�=���{�=�������\p�=I¦�~ls����6~��SC�������|?`Ԕ�F�p�Q_(�Gp�r8�/��R����v��o��ɼ�T�]iF�i{��(l��N����+�W�,�8�߳���̙!��L�r?�Ú��~���T���_l�Z�sill�nV���#8�5�
�G��qç�6�ǯoh3�1�9	�C��Łh���� A�mX����h�wu���a�鉆bXlQ�dr��+�l�(Z��w��/$+
��H�%Y�С���U�F�������L��.�݄6�4�j�����,#�2�Yy�ŢT��;�I1}�?���},�0:S��hp	�4�K�j������b�)']����q�S���Bb?��j����I�Jͽ���u:n���I>z3�3Q�H�9�E�ʞq�4�KNm_e��(�])�,�(��j�,�b�.��I�ĬutG�I����{�>�v����e!�O��CA�"�턠����T�>�-��f��1�4�N$����nS$N,*�o�'��@1��q��+�����9[?��B �]�C�=1�b�Y��C�]l6� �"z"���Y�5��hl���'�<���t]�v�F�9�����%*t��3�Ha��"0e�`�z32K��q���c8l$���n��g6g�"��D5��B��e%%�Sp A�t<�$fP�����@��[��'�i����:���e�������iF��WP�@�R�{C3l�/r��>�3�d�	�&�!D&�7y Yy��H1�}!	��r�+Q��ϛ�z=* ����JG!�b�)��8�4F�/aZw�_�FS���oh.�Ҿ�d"���Fg���C�l��AU*�*.�ft�%M��=[ϫW���7���$7jj�#�B���a1�+�LG��y*u�-�O�3?L���8�X`�ut�V=ZD���H�İ�T�!1�ǭ!��$��4Y	4�\�9�T[��ʁ����E���29�I<$�3�����6p���>�@����..R%"Mح��n� F8���<�P�>~*A+ˋ�MJ�q��?�f���c�\�ͮ�M��� g��"��V�<�r��x�:DFy�����t����Ƈe���\�#p��:G"�k�!["]Uya)GFY�_~��u�f��e�ZM:H<��G�P���w\�H�26>���ir�PJdߜ�Yc�L)hleW�Xјz�-?j���BJ̉�bV�\��m8۩l�σ/������#7ʘ����s5�X�Х�T����D:�3�(�e�j��,?q�h�W���G���"%R��g�����.E��0o�?�3O���7ʓ�W���y~MQ�#楺@��O����>2�[%�	b�8���MxH'ST���C1�f���n��s�s�[�~&�(6j�rn���I��;��J�]�[�#8�Z�G-�9{�;ǎژ#�vY�yi R��S6sIz��r�}�i�,L���i��jm� wtrVH�J��꭪H�]}_�b�+�WW�����Q��
��z�$&/�C&�No�}���]$ ��.���w��ߜU(�#�t{!BE�#v��yq��2�4j_����c����o><�����qZ���O�ݱ���j��L�e�]�u��iR���L���j�ߴ��Y"QO�\�<����勨8�o�۶�}�Q
��1�狉3Ǥ@�AyPtf��{�h����˶�:�#�A;��J�]�au�N=��Ȅ��%�4v��m57���/i=����+5\c�m@t��G> b��]�9"�dv�FH��z�ꇌ��_���B�i*�q�5�z�K���Oh!��?u���U�q����3��$;���{���{�D^dN#o���:�Mjb��G2b�L�L�2�c�K�Ƀ�P��G���A�Հ�U�11?�38\��+ױ��|�3iX�H�2ݠ�*� ;	=�c�`�'v�_�X�ǥ�WL2ϯ�uS�h65U�lj>Ùܱdڄ�������q��1t�M�6`�X��4\G
?�p�:!��ǟ�䬊�7��RH�dj���|M��}���`��2U)hT� %.�nz=ؾ��&w������D�D͗�%��i���fO�I6��r�7�;ٖqk=.��g�U��2�Ȅ���T��=���-��5JC�B�� ?.��
����=J���׎���QE$ӾlR�����Q�o?��E�б�ζo��B�,A��rW���q�L��{D���`Jl ������2��}ba�de��2G�)�(�iyB3H������C׹F��ՠo5�������������@���'n�%@���RB�&ܸd�yp2\�<��~��:����>�(5�q���x����<u�¼����(	���6�[r2b�;Ҽ|��!)�<����F���r#�8X��=j�z�.s���&�����w2�$��?�*���cZI�<
��J2�%"�~�M1g_jHK�k$	Y|V�Bb�^D�-#��Ƨ�6��9]�rV(I.,>ޑ�*&t��y��n�Κc�����'H懱��*��q����s�Q����������W��#�gY�Wn�f�MBA������'HD~Y�U\v�6�"x��q��R}���A�ͫ�,h�n�*�庱$�:[dk��6�d.��s�c�����(�Q���/�d/:"j���B����uG:��5幍�5��*���>]��*Ɩz��i�lq>�E�\A5�/�`cM�LzhlBLeFb|C��l	�˶��{Gp�B\-��o��L�*��..j��S��	�7<���$�)�0/��br    	� p�6�~7������}� ��&�Lvn�!p�Ay�=�����ہ�'�Nr���p���F��ji�ھ���v��h��
$��NX��%Di���e6Uu(ia�=�V�[�s�	ӵP�����y�-fZ�/@��d���>�Ƙ��d�sT��y��~���=�(�A�p?g&���:��f�|���L�$̀Y~��|RȻӘV��v�y)݄;����o�۵����w�.�Xr��W�*�@"Z�7�$�[#FoopY��s��r�`��0͈���F�Z�)�t��O_#����'$�w�$
�e���<"�I����P�S�s�!�i��3"���1��A~_��p��M;���4]�&1�"��h�X� ;��.����8�=X4�:��3@i*�ެO��%���e݉�_�	�'I��٣�b��yJ�I�>e�6�r�S�,z����,g$7Q��kj���f�w��u�2��I%�45�bT����&�2�8����h�7�G�`�E6�`^��,Ug)IS _3/G�QtUr�c��:/�O�7^.�V0f"Q@1���^e���w���B��щڵ��4�����.�6���sh�v�'MԿ����X����g,�͜=4�΄4RPm^k�w;�,T� r�ә����R,G�^���M�15?.��.߂�s��\�c��h�hS��M]�X��l�@9����	C.w-b�ԛ��f��G H��úy-�"aW�g=��5�$~uU��AR����<+G1}QKEU��`%���8���z*+'e����a��K'��E]}N1���>U��WQ�1���XjU/#�Z��Ш�r�ižz7RO�.�?c7����Iᘝl�DR�AF�H��3��)���^U&��.�+�5*��j�o��f���pɕ%&��F�S�`����pSv	�چ�]@��Y�]��JY�K'��RE���ʥi]�<�=ھ��^��E̹o#�P�rugnu}XV��蓫x�ED�y���k�{�H�d^~�GJ�rN�b�R���x��RKE �X���y�b� (S
�X�V��i�u(3��c�b�����K{�Ty�ؠf̈�b^�?EUS|����<�̣+���m��-�i֙<�}�<��\���[��)C'� ���T�K����)7E�����;1��m�d��c.T���DQl�����i�crC�B��_  ��. N��yT�V#���[�VH�e{�Ny�dW ?��'L���z�;��N�a���[^L6��;��?���R��Tzg�b/h�Nd�=��Љ�e�zT�T������ٷ����T�0p��M���\�H^*�c��#z^H��f��YF-�=-��^�Tb�0.����ÇMx)�#�t݊y������F��"[��:���lQ�8E96ؤ$A��rn�W���0-QD��/��͓�KPv��-�h�!@�'���pY�w�b�rԾg#,�/�I]��N����cBltq�Us�<�VoQ�&��<#��8�������⍚�����Awҫ�+e���H�-�;:o��`i娈�Ė@ܫ�j���|�x�P�ت��%��e��)�~6��� ��p%hD�6�L:~��P�gn��)j�0.#,YV/�:i�����.2�<�h�L�	.��/��!>.# 6�ΪɌծV����h����|��xBg_[�wF�9�������y��;������PBDHGO�Æģ��@�< ��c-�����ّ�s�)��݄��#^z&�q�vA�b�}�b��� �m3A�MJ�;�'S@b��جF� T��k倉�S�����1	�E9g���pX�SԈ*��|y������u��V�>s���y�4@ڪ����Ē���@�ȑ�@w��A�#j�^��EMN�h�E=)��j1�����)�'�f:I{��5K���O9k��)[ʞ�{t*G���D�4
�H��͙̃������J�F�����|J\�v��)�	�C�6<����(��i�F'P.����ש]�+��������V{�W��R(�a`��|��a��n�>w��x�~�T�8���Ӹ������U�Ɉ��L}�	��h�e���剅`���N�:���N��u��<!�� +#��(���"�<s�}p���g-��l�z�̮�<}�Kr�o�NB�.��2ؓ	9���V�f %�2���?��"��J����$�F�Fx3�^�|#b�� ?�J�C�<k��"��&*>nE�_5��Η��}�@&QW�`'���q:l�T9���-n>`I�T�64!7�s[!FX����~y{�^��i*N��O������6R���bA�=P����԰��#7�sh�!$�����d�[t��.'mD�m���� :K��f�v�Wp��5�>r���@��oRV�O�OwZ�(�.+�5o��ol�-1����l��l�%��0�������R>2����h�}�؝��#6�b�c"8���e]\�f tLs*��EyQ��?�������߳D�N�|i�¶p ��t�:ܸ��::��><��GΣc��˲����*��F��YE6��|Y3��!X��s�L��(�Y#��È�Ua%���GS�k�g�^���S���o�I�zj$�㸠s�t ��5U���x��T*����� �9B���52嵻i�?xv+_�(%�H��_cR��W��Kly��3�S�nyf6X?�7&�э��������Py�Fg<�;�dv&@My=�q R	��z�8���[9�2SK��e�R�Xx"��%A�˾�fd����M#]�8�9���z6��9-Z��y�"6uZ�0�ZPW�8�k6�|XLI���t�\.��v[_��́J,���G�`"�9�0�b�5Y�0������ T%���u�)�I7P1d�Q�0��r�
ݬ�ƬO��r��O�m.�l�b��������4%O9���F���p�D��ّ����F۲P�)�����Q�.�V�[����S.�A�9mGjҸӃ>���KMR��\��a&���Q��-[�H��&?g<��<��������r�q��C����B��q�q��il2e�n$x�e���C�(�����a�d��.z�q�˕|-.�_H�;��$l�Cm>�oj<��>�y��Тկ��A���^؄&d������kd�T������� �O@*oe����z�F4�'E��St�A&2��$�e����aY�k;<�Wu����l~y���8���W�/�O�\���Vs%�94/�����>pe�l�u��"�����w��P��*�|U�zT� �P�"�qr��/H�l�V>��h��K����o�[��I�u�v=Sh�xht������<���ts��<.O��&OC���W��N4G��LH֘vv.Jt�m
|0�x��^��	ϐ`��
˼�5Lab��5��Ο7�w���d�Hg��(Iz��F����{�%Eb��>�wf�7��e�I��z||��ە����6_?�6���&��4k��|�HaS&���m}}������ۦ�oE�^�\���������"�������w����X�p&C@�J6)�1~�IDu��H��4�.�6��$	[E���>���M�+&��NS
VO��1��~���D��횅$B�ƭ3j�Z@d���yD]�f<:��$tt��B�Wر����Z߲e��\p�Sl���k]�He����@܅O1�{K�
x�"Rޞ�)ƆS�?�*�ӵ]y�fےZ��T~d����:k<���	��=b��i�X�ZƸ����:�?�����!����Ï�n��C��e[k���T}ŹRl�C[zQ�![�C������*�g6�9y��
i�PZ7Gȣ���xt�t�O?3>�����.�z`���;����O�:�` ��Lٔ�C� �M�I�3�[��8�P�`�y�q�u��e��O����c�����1~�d�',w�>�0mE��%Z�`�(��Zhc�"m�����u"��IcLyS{Z    ��c'�ʳ,��D8��l�	'�޵�&)�
�:p����Fǫr���QĠj�H��s��nZ�c�N+�j���ft�gO�sˮbތ��e�Wx�F���2�|���鍾��:�բqq�� W�(�����{��]��kw�r3�\�[����W���`P�*U��`m����%}�ߊ&���6h�=^����C�t��R},��zٮX8td�q��;��դ�C�W~�x��]�ljy7Qa~52�*E:�+�?${�KW�pu~�Gln���9��.��m��LfS)uxG(��x��jW����]�@�f ��ZAmC��z�Ա�C�F�hH���F�1RB�'I(���O��xI�vfp�#�!�gA�شXK��3;�<V�t;1z���S��6������O](��]	{qQ���H�*LL[zV��ʊ#�%�G�t�Q�����U��h>��:塀|a���$�=��X_��Ľt�诎p�H�x�o˛���sw��7���m�H�2'�w��w�^|F��&����$e�R#T6�.��Y��U�s7�H���*]�I���%㾖X�L����ëF��̼"c�yg<�n9�"����B��1��Y���XuĠ�����(�M.�cf\b��D�u:7��ހX=�IQ7�م��Eb��5 mY�x�����)�:��㾉w,��g_ܷ�%)Ȃ�qA��8Ģ}�"���A�w����'ڰ�Vǈ��\6�>�F6�������qJ����V�&r���~d�/;=��+��k[ /}��$Rg�0)Ҷ�7�Yډ":.jj׶�Z�`L4\�p�fs?*]YӨ�e:ƅ�����h���:m{��\f��czjN�*p�^���Q�S�Η29ȭ����%jj8~��x�5���=��|�#�_`"6�N{B��	�-fE�LG��W�h�չq920$W6��Z�S���[ ��#L��d�a�5_f١k�`ڠ��V��;�?�(b3
f�0"((Ӛ��x����~������L��x���9���ڐѲ7=
�d��,�n8�֝�2��t��H��}I�2ē������h��I�hUqYK�Mj�wЬj��#ú�������Ϧg�Ѕ�Ģێ8��J�7��w�X!ˡ!�2�Aɋ�Qm��u!��.�A3�M��;x�,u4�L��a���{`���tB��LЦ%�h�YwE:�M�H������G���I$�ޖ8xmW�O�i]-^ݱY�:w�b��%0���y��s��	^E�EqyF�+ג1���J�������F���Щ�\�i^����d�,$���6�2�m����;�N�^�3��?�F��<	uԥ�!�φ��T�ر<��.�t����]��s��聙a!DX����B$FbV�U%"�y��a�ߩ�Z7�{3Q�|9����s9I��y�u|�X+�yy��J�E^��']�ŉ�O��X�g�7�nH���P�՚���t)7'�X�r$Z�9/�������v�!X�ɌDPkѐ�� �4g���\�N�+O��C2�q���"V���sq6��D_(���&�u����������1��l��k�r5`?�����NF���-pܔ�� ��)nˣ.=E�]���]���Ya�R0Z�Z?�a�˥�|���ⶒ��O����8.]��7s�d��#&a\�yz�%��c7�%���׻���jF��,�k�r�ո� ����0XR�(������,�Wx���х�.�E�`�c��"R׎X��~G_d�2`7��}��06E}����;%[`�C��H�Ţ�X��l݉r� �$x�aa��0~d
��k}�3h�SUl\"Ơ��&�H��^`�(SQy~F���7E9�-VH��$�c/���+��5�X���	x�t4���9F����	�xH(�`�sv S�H~b��B�����*yJ7�	1�B����r)&\@��#J�	� u�O����e���8Z'
G>�aU�_�����j7����bg,4���z3l�R1l�N=�)�"�����?�2�M���;�hF���bb�]��{�`q.�wf۸G�l`d@Joǒ�+<a���7�>Ê�N�q�"�\N5)������*�˛�O��T�$2^�NT2����ȟ��ʹ�.C=l�e=cr�i�(�l����4?`���ba��j�����L)��3�������:��
��Qɘ�t��K���;���m\v,1��#����W�ݳ9xB���>��8ͤ���"M\^"����0W6S���X�v/U�<��QM.�ѱ�6���Hu�̢��4�J�OX��%�z�4��MG�$��3�.Q�`r��xF���l�pEy�FT,�<��
#�F�o��n�9d�"i�dGK�</��Q1���6��cS�8��d��:�jDq�%K�� ݠ�g�q�1���}| $D��?�bxiR"���р{�.X�<ј��@+m��9�0��p���e�ّǆ�<я�wAG�7}��]�9nӠ����a+�A��/��kg���A��ަԿ ���9`�45�����l�Xɽcv%��Y9�=������O�������"t�6/tFvϤ���&���߄���~��w\��eJy3l�BP̫d�BC���|ۦ	w�$ pbBG7	�¹�v��gU��qPthR2�(�M(�P�f�,S�U���
����4�B�t:�
e+:�Ž�Q�O��d�V��O�E��gG�����]璘�9⦾1�Ĥo��6�� -V��@�/��8��>�������{iL���V���Ǖށ]����V�>=Lk��Í�f|y�z@/R�N�c%��.!�$B#�s�;i����h�뷷Nm�\ZϗL����G_i�i�}֥26�E��3 4r�>J��j�;
ձ���Fr|��Q|ux1��}����=`��$�����r�ô�t,X�Tʬ��z�>z��Y����U��C�T�ЩsG4��#6�?)$�J�`��5�<Γ����� u�>�H�m������H19��s��=-#>��g+�6���4w�/�u7�-_� ;;�l[�K��)6j�;�~��`00���O���n(]<�8�ڴ��>iƃ�-H����e�ߏL,Ty�J;����Y���D.BV�Sm��I�ޫV*F��E�0j)�v�v�9i��t�xPL7�i�9ظ���$Y<�ܮO��TG��r���G*�|�<@�e��~�gM5mz���8�'C j�!�(���鴩g���so���<ZewV�W��{=l��w�\�˅��F��c���e����T����4�fXa$uY�Z��Z�	p@t����v��6����mC�`On6e ��߳�.�p����w�ǿ-6�6_�a�q���B8��!Y�T�LXy���p)Oh8�|6;�|����|�.��u$y>D�5�[
~�w����L}�K���;�!��G��X����Y�n9�o����,h�4�"��)d?�;2T�@���ʡ�X�|���ȴ�H�Ԉ�L�>�J:j���N}��v5�-�G9t5Ԝ28l�E���Ka�<��E�z~u��p�b���K7꽽���d���%�r���~zr��2u�Bٖ�pHJ�4FES;�gK���WKDirѮ8����p�G��SOs){�
��	$t�gA��~����;-�	L)i~�E6��@�>��ֲ�Xzw'�)n��M�5��b�-R��u�6N(fa8������t��j�X˰�Wx���4������U�P��mB������+�ql*��M(��D3����:$).��C�H�@�φ��ߌ*Z���Պ�QǸ���ӎ��߇C��=���d����<DG�A���?2�F͐əw�̆�ѣ�4�a��#�م �'�-���`!�@��F�O��Ci�}5�6W��Ɍ>��![�A���hd��4�y�H2�!}zLw��G]�r�&�Y����
��k)���L�n\�7Y�`�B0�Q��i����N��ߵ�d�r�B=䣦������%�E   ����gm�ё?]�yGsu�I<�)�m�=7��A@4����=��<t��a�3����D�S�'�1�XB[�v>��ן2�62���0�P8^H��8s ��)18R1��9�;�)��o6��i �\��I��j(�]hT���?�wn8�M;��e�Fci[`��9�'?̆��8վYT����Ҿ���C_>K�;OgpB'��!�
�^�/�}��a$*���"?��T$s��u�,�u�*�sV���8+ ?�z��gC����֑��}`xF��M獦�.8\�U��6�[Oy���h���b� ە����#���0�A�n����IYD_����=h6t�U��Y���1G����1/C~%�r\�*��>��U;s3����H  $6����Ĳѐ�Ff�	-6�B<��ez� /"âj�>0|[Pa���Y �Ɏ������ؼ�_}b��ء��%1b��8�$��^冕c�^�:��B�7��Vm��̕��T�m��G�$f��F���{��M����°�f:H������ƸM3atxt&�i�2ŪbhB0�ꂺ�I(�J�d̀	�```	ez��
�5������'$�,1Qi����
�Il�¦�#���C��Ԓ�B��y��x�h���c����;z�hy������0beJ��I�G���1�	��\�X��Xc �.8"�s_������٧|�cO�y���yj�F��s����Fo���uO��S�GwN������e�~q��pY�4�\(���SeL���J����Y�1PH�oP���>��,D�2��3�m�kSbD6kR���Cǜ�8rB�'{\l���6oy�qR���%gLgz�)uC��Yc�ħ%#$Ҧg�.�t\$';H*�!�p%Zf�h6+�h���2f���Q���e!r��xy�u�.C^�%��q��G�$�� ���yb�d��.tuRcaRe���2��&x�W��*�l��޿��K3TsL�
��� �h=���f�������?�4�     