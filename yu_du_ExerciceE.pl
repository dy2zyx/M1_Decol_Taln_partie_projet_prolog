/*Projet du module HMIN-206 TALN 2016 M1 , Nom et Prénom du étudiant : Du Yu(21512132)*/
% IMPORTANTS : les abréviations utilisés dans le grammaire sont définis comme suit:
% pp(pronom personnel),
% pn(pronom neutre),
% vt(verbes transitifs),
% vi(verbes non transitifs),
% n_sl(nom singulier),
% n_pl(nom pluriel),
% np(nom propre),
% art_sl(article singulier),
% art_pl(article pluriel),
% adj(adjective),
% adv(adverb),
% pn_rl_s(pronom relationnel sujet),
% pn_rl_o(pronom relationel objet),
% pn_po(pronom possessif),
% prep(préposition),
% pn_s(pronom sujet),
% pn_o(pronom objet),
% gn(group nominal),
% gv(group verbal),
% pn_demo(pronom démonstratif)
% phs(phrase),
% prop(proposition),
% va(verbe auxilière,avoir et être),
% mo_ex(mots explétif,"ne"),
% adv_ne(adverb négatif,"pas"),
% cc(complément circonstanciel),
% vc(verb copule,être),
% sujet(sujet),
% attribut(attribut),
% prop_objet(proposition objet),
% prop_adj(proposition adjective).

%%%%%%%%%%%%
%%%%%%%%%%%%    Dans la première partie,vous trouvez le vocabulaire et le grammaire correspondant.
%%%%%%%%%%%%    Dans la deuxième partie,vous pouvez à partir du grammaire , affichier les syntaxes grammaticaux de la phrase.
%%%%%%%%%%%%    Veuillez faire les tests séparament.





/*
%%%%%%%%%%%                             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%     La première partie      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%                             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Les phrases sont:
% ce ne est pas une conclusion a_la_quelle je crois.
% ce est une situation a_la_quelle il pense.
% ce est un resultat duquel il doute.
% celles sont des filles desquelles ils parlent.
entre(M,[M|L],L).
n(X,Y,sl,fem):-entre(conclusion,X,Y).
n(X,Y,sl,fem):-entre(situation,X,Y).
n(X,Y,sl,mas):-entre(conclusion,X,Y).
n(X,Y,pl,fem):-entre(filles,X,Y).
n(X,Y,sl,mas):-entre(resultat,X,Y).
pn_demo(X,Y,sl,mas):-entre(ce,X,Y).
pn_demo(X,Y,pl,fem):-entre(celles,X,Y).
art(X,Y,sl,fem):-entre(une,X,Y).
art(X,Y,sl,mas):-entre(un,X,Y).
art(X,Y,pl,_):-entre(des,X,Y).
pn_rl_o(X,Y,sl,fem):-entre(a_la_quelle,X,Y).
pn_rl_o(X,Y,sl,mas):-entre(duquel,X,Y).
pn_rl_o(X,Y,pl,fem):-entre(desquelles,X,Y).
pp(X,Y,sl,mas,premier_p):-entre(je,X,Y).
pp(X,Y,sl,mas,trois_p):-entre(il,X,Y).
pp(X,Y,pl,mas,trois_p):-entre(ils,X,Y).
mo_ex(X,Y):-entre(ne,X,Y).
adv_ne(X,Y):-entre(pas,X,Y).
vc(X,Y,sl,trois_p):-entre(est,X,Y).
vc(X,Y,pl,trois_p):-entre(sont,X,Y).
vi(X,Y,sl,premier_p):-entre(crois,X,Y).
vi(X,Y,sl,trois_p):-entre(pense,X,Y).
vi(X,Y,sl,trois_p):-entre(doute,X,Y).
vi(X,Y,pl,trois_p):-entre(parlent,X,Y).

phs(X,Y):-sujet(X,A,N,_,_),predicat(A,B,N,_),objet(B,C,N0,G),complement(C,Y,N0,G,_).
sujet(X,Y,N,G,_):-pn_demo(X,Y,N,G).
sujet_prop(X,Y,N,G,P):-pp(X,Y,N,G,P).
predicat(X,Y,_,_):-mo_ex(X,A),vc(A,B,N,P),adv_ne(B,Y).
predicat(X,Y,N,_):-vc(X,Y,N,P).
predicat(X,Y,_,_):-vi(X,Y,N,P).
objet(X,Y,N,G):-gn(X,Y,N,G).
gn(X,Y,N,G):-art(X,A,N,G),n(A,Y,N,G).
prop_objet(X,Y,_,G,_):-sujet_prop(X,A,N,G,_),gv(A,Y,N,G).
gv(X,Y,_,_):-vi(X,Y,N,_).
complement(X,Y,N,G,_):-pn_rl_o(X,A,N,G),prop_objet(A,Y,_,_,_).
*/
%%%%%%%%%%%%%%%                             Commentaires
%%%%%%%%%%%%%%% Pour tester le grammaire ci-dessus , vous pouvez taper dans la ligne de commande de prolog
%%%%%%%%%%%%%%% "phs([mettez vos phrases à tester ici],[])." Par example
%%%%%%%%%%%%%%% phs([ce,ne,est,pas,la,conclusion,a_la_quelle,je,crois],[]).

%%%%%%%%%%%%%%% FIN DE LA PREMIERE PARTIE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








%%%%%%%%%%%%                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%  La deuxième partie    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


entre(M,[M|L],L).
n([nom,conclusion],X,Y,sl,fem):-entre(conclusion,X,Y).
n([nom,situation],X,Y,sl,fem):-entre(situation,X,Y).
n([nom,conclusion],X,Y,sl,mas):-entre(conclusion,X,Y).
n([nom,filles],X,Y,pl,fem):-entre(filles,X,Y).
n([nom,resultat],X,Y,sl,mas):-entre(resultat,X,Y).
pn_demo([pronom_demonstratif,ce],X,Y,sl,mas):-entre(ce,X,Y).
pn_demo([pronom_demonstratif,celles],X,Y,pl,fem):-entre(celles,X,Y).
art([article,une],X,Y,sl,fem):-entre(une,X,Y).
art([article,un],X,Y,sl,mas):-entre(un,X,Y).
art([article,des],X,Y,pl,_):-entre(des,X,Y).
pn_rl_o([pronom_reltif_objet,a_la_quelle],X,Y,sl,fem):-entre(a_la_quelle,X,Y).
pn_rl_o([pronom_reltif_objet,duquel],X,Y,sl,mas):-entre(duquel,X,Y).
pn_rl_o([pronom_reltif_objet,desquelles],X,Y,pl,fem):-entre(desquelles,X,Y).
pp([pronom_personnel,je],X,Y,sl,mas,premier_p):-entre(je,X,Y).
pp([pronom_personnel,il],X,Y,sl,mas,trois_p):-entre(il,X,Y).
pp([pronom_personnel,ils],X,Y,pl,mas,trois_p):-entre(ils,X,Y).
mo_ex([mots_expletif,ne],X,Y):-entre(ne,X,Y).
adv_ne([adverbe_negatif,pas],X,Y):-entre(pas,X,Y).
vc([verb_copule,est],X,Y,sl,trois_p):-entre(est,X,Y).
vc([verb_copule,sont],X,Y,pl,trois_p):-entre(sont,X,Y).
vi([verbe_intransitif,crois],X,Y,sl,premier_p):-entre(crois,X,Y).
vi([verbe_intransitif,pense],X,Y,sl,trois_p):-entre(pense,X,Y).
vi([verbe_intransitif,doute],X,Y,sl,trois_p):-entre(doute,X,Y).
vi([verbe_intransitif,parlent],X,Y,pl,trois_p):-entre(parlent,X,Y).

analyse([phrase,SUJET,PREDICAT,OBJET,COMPLEMENT],X,Y):-sujet(SUJET,X,A,N,_,_),predicat(PREDICAT,A,B,N,_),objet(OBJET,B,C,N0,G),complement(COMPLEMENT,C,Y,N0,G,_).
sujet([sujet,PN_DEMO],X,Y,N,G,_):-pn_demo(PN_DEMO,X,Y,N,G).
sujet_prop([sujet_du_proposition,PP],X,Y,N,G,P):-pp(PP,X,Y,N,G,P).
predicat([predicat_de_phrase,MO_EX,VC,ADV_NE],X,Y,_,_):-mo_ex(MO_EX,X,A),vc(VC,A,B,N,P),adv_ne(ADV_NE,B,Y).
predicat([predicat_de_phrase,VC],X,Y,N,_):-vc(VC,X,Y,N,P).
predicat([predicat_de_phrase,VI],X,Y,_,_):-vi(VI,X,Y,N,P).
objet([objet_de_phrase,GN],X,Y,N,G):-gn(GN,X,Y,N,G).
gn([groupe_nomminal,ART,NOM],X,Y,N,G):-art(ART,X,A,N,G),n(NOM,A,Y,N,G).
prop_objet([proposition_objet,SUJET_PROP,GV],X,Y,_,G,_):-sujet_prop(SUJET_PROP,X,A,N,G,_),gv(GV,A,Y,N,G).
gv([groupe_verbal,VI],X,Y,_,_):-vi(VI,X,Y,N,_).
complement([complement_de_phrase,PN_RL_O,PROP_OBJET],X,Y,N,G,_):-pn_rl_o(PN_RL_O,X,A,N,G),prop_objet(PROP_OBJET,A,Y,_,_,_).

%%%%%%%%%%%%%%%                             Commentaires
%%%%%%%%%%%%%%% Pour tester le grammaire ci-dessus , vous pouvez taper dans la ligne de commande de prolog
%%%%%%%%%%%%%%% "analyse(T,[mettez vos phrases à tester ici],[])." Par example
%%%%%%%%%%%%%%% analyse(T,[ce,ne,est,pas,une,conclusion,a_la_quelle,je,crois],[]).
