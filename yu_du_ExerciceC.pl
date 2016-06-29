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


% Exercice C
%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Pourque l'accord soit prise en compte,il faut distinquer les termes en fonctions de leur caractères grammaticaux.
%%%%%%%%%%%%%%% Par example,'je ne sais pas',ici, le sujet est 'je',et le prédicat est 'sais',pourque le programme n'affiche pas
%%%%%%%%%%%%%%% 'je ne sait pas' comme résultat(comme le mot 'sait' se trouve aussi dans le vocabulaire),ici,j'ai ajouté des infos comme suit:
%%%%%%%%%%%%%%% vt(X,Y,sl,premier_p):-entre(sais,X,Y). J'ai précisé que 'sais',c'est verbe singulier et au première personne,Ainsi,
%%%%%%%%%%%%%%% j'ai précisé aussi que 'je' est un pronom personnel singulier,et au première personne,et aussi dans le grammaire de la construction
%%%%%%%%%%%%%%% des phrases, lorsque le sujet est au singulier première personne,le prédicat aussi doit être au singulier première personne,
%%%%%%%%%%%%%%% C'est comme ça que l'accord a prise en compte.
%%%%%%%%%%%%%%%
entre(M,[M|L],L).
pp(X,Y,sl,mas,trois_p):-entre(il,X,Y).
pp(X,Y,sl,mas,deux_p):-entre(tu,X,Y).
pp(X,Y,sl,mas,premier_p):-entre(je,X,Y).
pp(X,Y,sl,fem,trois_p):-entre(elle,X,Y).
pp(X,Y,pl,mas,premier_p):-entre(nous,X,Y).
pn_demo(X,Y,sl,mas):-entre(ce,X,Y).
vt(X,Y,sl,trois_p):-entre(sait,X,Y).
vt(X,Y,sl,premier_p):-entre(sais,X,Y).
vt(X,Y,sl,_):-entre(voir,X,Y).
vt(X,Y,sl,_):-entre(casse,X,Y).
vt(X,Y,sl,deux_p):-entre(preferes,X,Y).
vi(X,Y,sl,_):-entre(venue,X,Y).
vi(X,Y,sl,trois_p):-entre(excelle,X,Y).
vi(X,Y,sl,premier_p):-entre(peux,X,Y).
vi(X,Y,pl,premier_p):-entre(travaillons,X,Y).
pn_rl_s(X,Y,sl,mas):-entre(lequel,X,Y).
pn_rl_s(X,Y,sl,fem):-entre(laquelle,X,Y).
pn_rl_s(X,Y,pl,mas):-entre(lesquels,X,Y).
pn_rl_s(X,Y,pl,fem):-entre(lesquelles,X,Y).
pn_po(X,Y,pl,deux_p):-entre(tiennes,X,Y).
prep(X,Y):-entre(de,X,Y).
prep(X,Y):-entre(avec,X,Y).
prep(X,Y):-entre(parmis,X,Y).
prep(X,Y):-entre(dans,X,Y).
prep(X,Y):-entre(du,X,Y).
prep(X,Y):-entre(en,X,Y).
art(X,Y,pl,_):-entre(ces,X,Y).
art(X,Y,pl,mas):-entre(les,X,Y).
art(X,Y,sl,mas):-entre(le,X,Y).
art(X,Y,sl,fem):-entre(la,X,Y).
art(X,Y,sl,mas):-entre(un,X,Y).
n(X,Y,sl,fem):-entre(voiture,X,Y).
n(X,Y,sl,mas):-entre(domaine,X,Y).
n(X,Y,sl,fem):-entre(fenetre,X,Y).
n(X,Y,pl,mas):-entre(logiciels,X,Y).
n(X,Y,pl,fem):-entre(chaussettes,X,Y).
n(X,Y,pl,fem):-entre(bagues,X,Y).
n(X,Y,pl,mas):-entre(enfants,X,Y).
va(X,Y,sl,trois_p):-entre(a,X,Y).
va(X,Y,sl,trois_p):-entre(est,X,Y).
va(X,Y,pl,trois_p):-entre(sont,X,Y).
vc(X,Y,sl,trois_p):-entre(est,X,Y).
adj(X,Y,sl,_):-entre(rouge,X,Y).
adv(X,Y):-entre(effectivement,X,Y).
mo_ex(X,Y):-entre(ne,X,Y).
adv_ne(X,Y):-entre(pas,X,Y).

phs(X,Y):-sujet(X,A,_,_,_),predicat(A,B,_,_),objet(B,Y,_,_,_).% N s'agit soit du pluriel,soit du singulier. G s'agit de la partie grammatical,P s'agit de la partie personnel.
phs(X,Y):-sujet(X,A,N,_,_),vc(A,B,N,_),attribut(B,Y,_,_,_).
phs(X,Y):-sujet(X,A,N,G,P),predicat(A,B,N,P),objet(B,C,N0,G0,P0),cc(C,Y,N0,G0).
sujet(X,Y,N,G,P):-pp(X,Y,N,G,P).
sujet(X,Y,N,G,_):-pn_demo(X,Y,N,G).
predicat(X,Y,N,P):-vt(X,Y,N,P).
predicat(X,Y,N,P):-vi(X,A,N,P),adv(A,B),vt(B,Y,N,P).
predicat(X,Y,N,P):-mo_ex(X,A),vt(A,B,N,P),adv_ne(B,Y).
objet(X,Y,N,G,P):-prop_objet(X,Y,N,G,P).
objet(X,Y,N,G,P):-gn(X,A,N,G),prop_adj(A,Y,N,G,P).
objet(X,Y,N,G,P):-sujet_prop(X,Y,N,G,P).
prop_objet(X,Y,_,G,_):-sujet_prop(X,A,N,G,_),predicat_prop(A,B,N,_),objet_prop(B,Y,N,G0).
sujet_prop(X,Y,N,G,_):-pn_rl_s(X,A,N,G),prep(A,B),gn(B,Y,pl,G).
sujet_prop(X,Y,N,G,P):-pp(X,Y,N,G,P).
sujet_prop(X,Y,N,G,_):-pn_rl_s(X,Y,N,G).
predicat_prop(X,Y,N,P):-gv(X,Y,N,P).
objet_prop(X,Y,N,G):-gn(X,Y,N,G).
gn(X,Y,sl,G):-art(X,A,sl,G),n(A,Y,sl,G).
gn(X,Y,pl,G):-art(X,A,pl,G),n(A,Y,pl,G).
gn(X,Y,pl,G):-art(X,A,pl,G),pn_po(A,Y,N,P).
gv(X,Y,N,P):-va(X,A,N,P),vt(A,Y,N,P).
gv(X,Y,N,P):-va(X,Y,N,P).
gv(X,Y,N,P):-va(X,A,N,P),vi(A,Y,N,P).
gv(X,Y,N,P):-vi(X,Y,N,P).
attribut(X,Y,N,G,P):-gn(X,A,N,G),adj(A,B,N,G),prop_adj(B,Y,N,G,P).
attribut(X,Y,N,G,P):-gn(X,A,N,G),prop_adj(A,Y,N,G,P).
prop_adj(X,Y,N,G,P):-prep(X,A),pn_rl_s(A,B,N,G),sujet_prop(B,C,N,G,P0),gv(C,Y,N,_).
cc(X,Y,N,G):-prep(X,A),gn(A,Y,N,G).

%%%%%%%%%%%%%%%                             Commentaires
%%%%%%%%%%%%%%% Pour tester le grammaire ci-dessus , vous pouvez taper dans la ligne de commande de prolog
%%%%%%%%%%%%%%% "phs([mettez vos phrases à tester ici],[])." L'example pour la première phrase "phs([il,sait,lequel,de,ces,enfants,a,casse,la,fenetre],[])."
%%%%%%%%%%%%%%% Faire attention aux caractères spécifiques comme é ê ç , le compilateur de prolog ne les reconnait pas
