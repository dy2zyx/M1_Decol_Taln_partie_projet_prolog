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


% Exercice B:

% DCG correspondant au grammaire précédant est le suivant:
entre(M,[M|L],L).
pp(X,Y):-entre(il,X,Y).
pp(X,Y):-entre(tu,X,Y).
pp(X,Y):-entre(je,X,Y).
pp(X,Y):-entre(elle,X,Y).
pp(X,Y):-entre(nous,X,Y).
pn_demo(X,Y):-entre(ce,X,Y).
vt(X,Y):-entre(sait,X,Y).
vt(X,Y):-entre(sais,X,Y).
vt(X,Y):-entre(voir,X,Y).
vt(X,Y):-entre(casse,X,Y).
vt(X,Y):-entre(preferes,X,Y).
vi(X,Y):-entre(venue,X,Y).
vi(X,Y):-entre(excelle,X,Y).
vi(X,Y):-entre(peux,X,Y).
vi(X,Y):-entre(travaillons,X,Y).
pn_rl_s(X,Y):-entre(lequel,X,Y).
pn_rl_s(X,Y):-entre(laquelle,X,Y).
pn_rl_s(X,Y):-entre(lesquels,X,Y).
pn_rl_s(X,Y):-entre(lesquelles,X,Y).
pn_po(X,Y):-entre(tiennes,X,Y).
prep(X,Y):-entre(de,X,Y).
prep(X,Y):-entre(avec,X,Y).
prep(X,Y):-entre(parmis,X,Y).
prep(X,Y):-entre(dans,X,Y).
prep(X,Y):-entre(du,X,Y).
prep(X,Y):-entre(en,X,Y).
art_pl(X,Y):-entre(ces,X,Y).
art_pl(X,Y):-entre(les,X,Y).
art_sl(X,Y):-entre(le,X,Y).
art_sl(X,Y):-entre(la,X,Y).
art_sl(X,Y):-entre(un,X,Y).
n_sl(X,Y):-entre(voiture,X,Y).
n_sl(X,Y):-entre(domaine,X,Y).
n_sl(X,Y):-entre(fenetre,X,Y).
n_pl(X,Y):-entre(logiciels,X,Y).
n_pl(X,Y):-entre(chaussettes,X,Y).
n_pl(X,Y):-entre(bagues,X,Y).
n_pl(X,Y):-entre(enfants,X,Y).
va(X,Y):-entre(a,X,Y).
va(X,Y):-entre(est,X,Y).
va(X,Y):-entre(sont,X,Y).
vc(X,Y):-entre(est,X,Y).
adj(X,Y):-entre(rouge,X,Y).
adv(X,Y):-entre(effectivement,X,Y).
mo_ex(X,Y):-entre(ne,X,Y).
adv_ne(X,Y):-entre(pas,X,Y).

% Le grammaire s'écrit en DCG :
phs(X,Y):-sujet(X,A),predicat(A,B),objet(B,Y).
phs(X,Y):-sujet(X,A),vc(A,B),attribut(B,Y).
phs(X,Y):-sujet(X,A),predicat(A,B),objet(B,C),cc(C,Y).
sujet(X,Y):-pp(X,Y).
sujet(X,Y):-pn_demo(X,Y).
predicat(X,Y):-vt(X,Y).
predicat(X,Y):-vi(X,A),adv(A,B),vt(B,Y).
predicat(X,Y):-mo_ex(X,A),vt(A,B),adv_ne(B,Y).
objet(X,Y):-prop_objet(X,Y).
objet(X,Y):-gn(X,A),prop_adj(A,Y).
objet(X,Y):-sujet_prop(X,Y).
prop_objet(X,Y):-sujet_prop(X,A),predicat_prop(A,B),objet_prop(B,Y).
sujet_prop(X,Y):-pn_rl_s(X,A),prep(A,B),gn(B,Y).
sujet_prop(X,Y):-pp(X,Y).
sujet_prop(X,Y):-pn_rl_s(X,Y).
predicat_prop(X,Y):-gv(X,Y).
objet_prop(X,Y):-gn(X,Y).
gn(X,Y):-art_pl(X,A),n_pl(A,Y).
gn(X,Y):-art_sl(X,A),n_sl(A,Y).
gn(X,Y):-art_pl(X,A),pn_po(A,Y).
gv(X,Y):-va(X,A),vt(A,Y).
gv(X,Y):-va(X,Y).
gv(X,Y):-va(X,A),vi(A,Y).
gv(X,Y):-vi(X,Y).
attribut(X,Y):-gn(X,A),adj(A,B),prop_adj(B,Y).
attribut(X,Y):-gn(X,A),prop_adj(A,Y).
prop_adj(X,Y):-prep(X,A),pn_rl_s(A,B),sujet_prop(B,C),gv(C,Y).
cc(X,Y):-prep(X,A),gn(A,Y).

%%%%%%%%%%%%%%%                             Commentaires
%%%%%%%%%%%%%%% Pour tester le grammaire ci-dessus , vous pouvez taper dans la ligne de commande de prolog
%%%%%%%%%%%%%%% "phs([mettez vos phrases à tester ici],[])." L'example pour la première phrase "phs([il,sait,lequel,de,ces,enfants,a,casse,la,fenetre],[])."
%%%%%%%%%%%%%%% Faire attention aux caractères spécifiques comme é ê ç , le compilateur de prolog ne les reconnait pas
