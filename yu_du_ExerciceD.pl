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

entre(M,[M|L],L).
pp([pronom_personnel,il],X,Y,sl,mas,trois_p):-entre(il,X,Y).
pp([pronom_personnel,tu],X,Y,sl,mas,deux_p):-entre(tu,X,Y).
pp([pronom_personnel,je],X,Y,sl,mas,premier_p):-entre(je,X,Y).
pp([pronom_personnel,elle],X,Y,sl,fem,trois_p):-entre(elle,X,Y).
pp([pronom_personnel,nous],X,Y,pl,mas,premier_p):-entre(nous,X,Y).
pn_demo([pronom_demonstratif,ce],X,Y,sl,mas):-entre(ce,X,Y).
vt([verbe_transitif,sait],X,Y,sl,trois_p):-entre(sait,X,Y).
vt([verbe_transitif,sais],X,Y,sl,premier_p):-entre(sais,X,Y).
vt([verbe_transitif,voir],X,Y,sl,_):-entre(voir,X,Y).
vt([verbe_transitif,casse],X,Y,sl,_):-entre(casse,X,Y).
vt([verbe_transitif,preferes],X,Y,sl,deux_p):-entre(preferes,X,Y).
vi([verbe_intransitif,venue],X,Y,sl,_):-entre(venue,X,Y).
vi([verbe_intransitif,excelle],X,Y,sl,trois_p):-entre(excelle,X,Y).
vi([verbe_intransitif,peux],X,Y,sl,premier_p):-entre(peux,X,Y).
vi([verbe_intransitif,travaillons],X,Y,pl,premier_p):-entre(travaillons,X,Y).
pn_rl_s([pronom_relatif_sujet,lequel],X,Y,sl,mas):-entre(lequel,X,Y).
pn_rl_s([pronom_relatif_sujet,laquelle],X,Y,sl,fem):-entre(laquelle,X,Y).
pn_rl_s([pronom_relatif_sujet,lesquels],X,Y,pl,mas):-entre(lesquels,X,Y).
pn_rl_s([pronom_relatif_sujet,lesquelles],X,Y,pl,fem):-entre(lesquelles,X,Y).
pn_po([pronom_possessif,tiennes],X,Y,pl,deux_p):-entre(tiennes,X,Y).
prep([preposition,de],X,Y):-entre(de,X,Y).
prep([preposition,avec],X,Y):-entre(avec,X,Y).
prep([preposition,parmis],X,Y):-entre(parmis,X,Y).
prep([preposition,dans],X,Y):-entre(dans,X,Y).
prep([preposition,du],X,Y):-entre(du,X,Y).
prep([preposition,en],X,Y):-entre(en,X,Y).
art([article,ces],X,Y,pl,_):-entre(ces,X,Y).
art([article,les],X,Y,pl,mas):-entre(les,X,Y).
art([article,le],X,Y,sl,mas):-entre(le,X,Y).
art([article,la],X,Y,sl,fem):-entre(la,X,Y).
art([article,un],X,Y,sl,mas):-entre(un,X,Y).
n([nom,voiture],X,Y,sl,fem):-entre(voiture,X,Y).
n([nom,domaine],X,Y,sl,mas):-entre(domaine,X,Y).
n([nom,fenetre],X,Y,sl,fem):-entre(fenetre,X,Y).
n([nom,logiciels],X,Y,pl,mas):-entre(logiciels,X,Y).
n([nom,chaussettes],X,Y,pl,fem):-entre(chaussettes,X,Y).
n([nom,bagues],X,Y,pl,fem):-entre(bagues,X,Y).
n([nom,enfants],X,Y,pl,mas):-entre(enfants,X,Y).
va([verb_auxiliaire,a],X,Y,sl,trois_p):-entre(a,X,Y).
va([verb_auxiliaire,est],X,Y,sl,trois_p):-entre(est,X,Y).
va([verb_auxiliaire,sont],X,Y,pl,trois_p):-entre(sont,X,Y).
vc([verb_copule,est],X,Y,sl,trois_p):-entre(est,X,Y).
adj([adjective,rouge],X,Y,sl,_):-entre(rouge,X,Y).
adv([adverbe,effectivement],X,Y):-entre(effectivement,X,Y).
mo_ex([mots_expletif,ne],X,Y):-entre(ne,X,Y).
adv_ne([adverbe_negatif,pas],X,Y):-entre(pas,X,Y).

analyse([phrase,SUJET,PREDICAT,OBJET],X,Y):-sujet(SUJET,X,A,_,_,_),predicat(PREDICAT,A,B,_,_),objet(OBJET,B,Y,_,_,_).% N s'agit soit du pluriel,soit du singulier. G s'agit de la partie grammatical,P s'agit de la partie personnel.
analyse([phrase,SUJET,VC,ATTRIBUT],X,Y):-sujet(SUJET,X,A,N,_,_),vc(VC,A,B,N,_),attribut(ATTRIBUT,B,Y,_,_,_).
analyse([phrase,SUJET,PREDICAT,OBJET,CC],X,Y):-sujet(SUJET,X,A,N,G,P),predicat(PREDICAT,A,B,N,P),objet(OBJET,B,C,N0,G0,P0),cc(CC,C,Y,N0,G0).
sujet([sujet,PP],X,Y,N,G,P):-pp(PP,X,Y,N,G,P).
sujet([sujet,PN_DEMO],X,Y,N,G,_):-pn_demo(PN_DEMO,X,Y,N,G).
predicat([predicat,VT],X,Y,N,P):-vt(VT,X,Y,N,P).
predicat([predicat,VI,ADV,VT],X,Y,N,P):-vi(VI,X,A,N,P),adv(ADV,A,B),vt(VT,B,Y,N,P).
predicat([predicat,MO_EX,VT,ADV_NE],X,Y,N,P):-mo_ex(MO_EX,X,A),vt(VT,A,B,N,P),adv_ne(ADV_NE,B,Y).
objet([objet,PROP_OBJET],X,Y,N,G,P):-prop_objet(PROP_OBJET,X,Y,N,G,P).
objet([objet,GN,PROP_ADJ],X,Y,N,G,P):-gn(GN,X,A,N,G),prop_adj(PROP_ADJ,A,Y,N,G,P).
objet([objet,SUJET_PROP],X,Y,N,G,P):-sujet_prop(SUJET_PROP,X,Y,N,G,P).
prop_objet([proposition_objet,SUJET_PROP,PREDICAT_PROP,OBJET_PROP],X,Y,_,G,_):-sujet_prop(SUJET_PROP,X,A,N,G,_),predicat_prop(PREDICAT_PROP,A,B,N,_),objet_prop(OBJET_PROP,B,Y,N,G0).
sujet_prop([sujet_du_proposition,PN_RL_S,PREP,GN],X,Y,N,G,_):-pn_rl_s(PN_RL_S,X,A,N,G),prep(PREP,A,B),gn(GN,B,Y,pl,G).
sujet_prop([sujet_du_proposition,PP],X,Y,N,G,P):-pp(PP,X,Y,N,G,P).
sujet_prop([sujet_du_proposition,PN_RL_S],X,Y,N,G,_):-pn_rl_s(PN_RL_S,X,Y,N,G).
predicat_prop([predicat_du_proposition,GV],X,Y,N,P):-gv(GV,X,Y,N,P).
objet_prop([objet_du_proposition,GN],X,Y,N,G):-gn(GN,X,Y,N,G).
gn([groupe_nomminal,ART,NOM],X,Y,sl,G):-art(ART,X,A,sl,G),n(NOM,A,Y,sl,G).
gn([groupe_nomminal,ART,NOM],X,Y,pl,G):-art(ART,X,A,pl,G),n(NOM,A,Y,pl,G).
gn([groupe_nomminal,ART,PN_PO],X,Y,pl,G):-art(ART,X,A,pl,G),pn_po(PN_PO,A,Y,N,P).
gv([groupe_verbal,VA,VT],X,Y,N,P):-va(VA,X,A,N,P),vt(VT,A,Y,N,P).
gv([groupe_verbal,VA],X,Y,N,P):-va(VA,X,Y,N,P).
gv([groupe_verbal,VA,VI],X,Y,N,P):-va(VA,X,A,N,P),vi(VI,A,Y,N,P).
gv([groupe_verbal,VI],X,Y,N,P):-vi(VI,X,Y,N,P).
attribut([attribut,GN,ADJ,PROP_ADJ],X,Y,N,G,P):-gn(GN,X,A,N,G),adj(ADJ,A,B,N,G),prop_adj(PROP_ADJ,B,Y,N,G,P).
attribut([attribut,GN,PROP_ADJ],X,Y,N,G,P):-gn(GN,X,A,N,G),prop_adj(PROP_ADJ,A,Y,N,G,P).
prop_adj([proposition_adjective],X,Y,N,G,P):-prep(PREP,X,A),pn_rl_s(PN_RL_S,A,B,N,G),sujet_prop(SUJET_PROP,B,C,N,G,P0),gv(GV,C,Y,N,_).
cc([complement_circonstanciel,PREP,GN],X,Y,N,G):-prep(PREP,X,A),gn(GN,A,Y,N,G).


%%%%%%%%%%%%%%%                             Commentaires
%%%%%%%%%%%%%%% Pour tester le grammaire ci-dessus , vous pouvez taper dans la ligne de commande de prolog
%%%%%%%%%%%%%%% "analyse(T,[mettez vos phrases à tester ici],[])." Par example
%%%%%%%%%%%%%%% analyse(T,[il,sait,lequel,de,ces,enfants,a,casse,la,fenetre],[]).
