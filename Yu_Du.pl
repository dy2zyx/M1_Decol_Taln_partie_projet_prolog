/* Projet du module HMIN-206 TALN 2016 M1 , Nom et Prénom du étudiant : Du Yu(numéro de la carte : 21512132) */

%%%%%%%%%%%%%%%%%%%  Une précision du Rendu du projet :
%%%%%%%%%%%%%%%%%%%  Vous pouvez trouver et tester dans ce fichier les réponses de tous les exercices du projet , sauf le dernier exercice(l'interface) que je l'ai pas réussi à le faire.
%%%%%%%%%%%%%%%%%%%  La réponse du chaque exercice est séparée par un caractères des commentaire comme '/* La réponse du exercice */'
%%%%%%%%%%%%%%%%%%%  Vous pouvez tester les réponses du chaque exercice séparément.Les consignes pour faire des testes sont données à la fin du chaque exercice.

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

/*
%%%%%%%%%%%%%%%%%%%%%%                              %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%            Exercice A        %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%                              %%%%%%%%%%%%%%%%%%%%%%

% Pronoms relatifs sujets : lequel , laquelle , lesquels , lesquelles.

% Exemples des phrases :

% 1) il sait lequel de ces enfants a cassé la fenêtre.
% 2) ce est la voiture rouge avec laquelle elle est venue.
% 3) tu peux effectivement voir les logiciels avec lesquels nous travaillons.
% 4) je ne sais pas lesquelles sont les tiennes parmis ces chaussettes.
% 5) tu preferes laquelle de ces bagues?
% 6) ce est un domaine dans laquelle il excelle.
% 7) ce est un domaine dans lequel il excelle.


% Les vocabulaires se trouvent par la suite :

pp --> [il].
pp --> [tu].
pp --> [je].
pp --> [elle].
pp --> [nous].
pn_demo --> [ce].
vt --> [sait].
vt --> [sais].
vt --> [voir].
vt --> [casse].
vt --> [preferes].
vi --> [venue].
vi --> [excelle].
vi --> [peux].
vi --> [travaillons].
pn_rl_s --> [laquelle].
pn_rl_s --> [lequel].
pn_rl_s --> [lesquels].
pn_rl_s --> [lesquelles].
pn_po --> [tiennes].
prep --> [de].
prep --> [avec].
prep --> [parmis].
prep --> [en].
prep --> [du].
prep --> [dans].
art_sl --> [la].
art_sl --> [le].
art_sl --> [un].
art_pl --> [ces].
art_pl --> [les].
n_sl --> [voiture].
n_sl --> [domaine].
n_sl --> [fenetre].
n_pl --> [enfants].
n_pl --> [logiciels].
n_pl --> [chaussettes].
n_pl --> [bagues].
va --> [a].
va --> [est].
va --> [sont].
vc --> [est].
adj --> [rouge].
adv --> [effectivement].
mo_ex --> [ne].
adv_ne --> [pas].

% Le grammaire hors-context(CFG):

% Une phrase peut avoir 'un sujet + un prédicat + un objet' ou 'un sujet + un verb copule être + un attribut' ou 'un sujet + un prédicat + un objet + un complément circonstanciel'.
phs --> sujet,predicat,objet | sujet,vc,attribut | sujet,predicat,objet,cc.
% Un sujet peut être un pronom personnel 'je,tu,nous,vous etc'ou un pronom démonstratif 'ce'.
sujet --> pp | pn_demo.
% Un prédicat peut être 'un verbe transitif' ou 'un verbe non transitif suivi par un adverb suivi par un verb transitif comme verbe complémentaire' ex: 'peut effectivement voir'.
% ou 'le mot explétif 'ne' + verbe transitif + adverbe négatif 'pas' '.
predicat --> vt | vi,adv,vt | mo_ex,vt,adv_ne.
% Un objet peut être 'une proposition d'objet' ou bien 'un group nominal suivi par une proposition adjective' ou bien 'un sujet de proposition,ex:laquelle de ces bagues'.
objet --> prop_objet | gn,prop_adj | sujet_prop.
% Une proposition d'objet peut avoir 'un sujet de proposition' , 'un prédicat de proposition' , et 'un objet de proposition'.
prop_objet --> sujet_prop,predicat_prop,objet_prop.
% Un sujet de proposition peut être 'un pronom relatif sujet suivi par un préposition suivi d'un group nominal ex:lequel de ces enfants' ou bien 'un pronom personnel' ou 'un pronom relatif sujet'.
sujet_prop --> pn_rl_s,prep,gn | pp | pn_rl_s.
% Un prédicat de proposition peut être un groupe verbals.
predicat_prop --> gv.
% Un objet de proposition peut être un groupe nominal.
objet_prop --> gn.
% Un groupe nominal peut être 'une article pluriel suivi d'un nom pluriel' ou 'une article singulier suivi d'un nom singulier' ou 'une article pluriel suivi d'un pronom possessif au pluriel ex: les tiennes'.
gn --> art_pl,n_pl | art_sl,n_sl | art_pl,pn_po.
% Un groupe verbal peut être un verb auxiliaire suivi d'un verbe transitif ou un verb auxiliaire.
gv --> va,vt | va | va,vi | vi.
% Une attribut peut être 'un groupe nominal suivi d'un adjective suivi d'une proposition adjective' ou 'un groupe nominal suivi d'une proposition adjective'.
attribut --> gn,adj,prop_adj | gn,prop_adj.
% Une proposition adjective peut être 'un préposition + un pronom relatif sujet + un sujet de proposition + un groupe verbals ,ex:avec lequelle elle est venue'.
prop_adj --> prep,pn_rl_s,sujet_prop,gv.
% Une complément circonstanciel peut être un prep suivi d'un group nominal ,ex:parmis les chaussettes.
cc --> prep,gn.

%%%%%%%%%%%%%%%                             Consignes
%%%%%%%%%%%%%%% Pour tester le grammaire ci-dessus , consulter le fichier d'abord dans SWI-Prolog,ensuite vous pouvez taper dans la ligne de commande de prolog
%%%%%%%%%%%%%%% "phs([mettez vos phrases à tester ici en séparant chaque mot avec ','],[])." L'example pour la première phrase "phs([il,sait,lequel,de,ces,enfants,a,casse,la,fenetre],[])."
%%%%%%%%%%%%%%% Faire attention aux caractères spécifiques comme é ê ç , le compilateur de prolog ne les reconnait pas

*/

/*
%%%%%%%%%%%%%%%%%%%%%%                              %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%            Exercice B        %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%                              %%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%                             Consignes
%%%%%%%%%%%%%%% Pour tester le grammaire ci-dessus , vous pouvez taper dans la ligne de commande de prolog
%%%%%%%%%%%%%%% "phs([mettez vos phrases à tester ici en séparant chaque mot avec ','],[])." L'example pour la première phrase "phs([il,sait,lequel,de,ces,enfants,a,casse,la,fenetre],[])."
%%%%%%%%%%%%%%% Faire attention aux caractères spécifiques comme é ê ç , le compilateur de prolog ne les reconnait pas

*/

/*
%%%%%%%%%%%%%%%%%%%%%%                              %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%            Exercice C        %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%                              %%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%                             Consignes
%%%%%%%%%%%%%%% Pour tester le grammaire ci-dessus , vous pouvez taper dans la ligne de commande de prolog
%%%%%%%%%%%%%%% "phs([mettez vos phrases à tester ici en séparant les mots avec ','],[])." L'example pour la première phrase "phs([il,sait,lequel,de,ces,enfants,a,casse,la,fenetre],[])."
%%%%%%%%%%%%%%% Faire attention aux caractères spécifiques comme é ê ç , le compilateur de prolog ne les reconnait pas
%%%%%%%%%%%%%%% Vous pouvez remarquer que si vous tester les dernières deux phrases comme par exemple:
%%%%%%%%%%%%%%% phs([ce,est,un,domaine,dans,lequel,il,excelle],[]).
%%%%%%%%%%%%%%% phs([ce,est,un,domaine,dans,laquelle,il,excelle],[]).
%%%%%%%%%%%%%%% Vous pouvez remarquer que le résultat est true pour la première mais false pour la deuxième,ce qui veut dire que l'accord est bien prise en compte.
*/

/*

%%%%%%%%%%%%%%%%%%%%%%                              %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%            Exercice D        %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%                              %%%%%%%%%%%%%%%%%%%%%%

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


%%%%%%%%%%%%%%%                             Consignes
%%%%%%%%%%%%%%% Pour tester le grammaire ci-dessus , vous pouvez taper dans la ligne de commande de prolog
%%%%%%%%%%%%%%% "analyse(T,[mettez vos phrases à tester ici en séparant chaque mot par ','],[])." Par example
%%%%%%%%%%%%%%% analyse(T,[il,sait,lequel,de,ces,enfants,a,casse,la,fenetre],[]).

*/


%%%%%%%%%%%%%%%%%%%%%%                              %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%            Exercice E        %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%                              %%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%    Dans la première partie,vous trouvez le vocabulaire et le grammaire correspondant.
%%%%%%%%%%%%%%%%%%%%%%    Dans la deuxième partie,vous pouvez à partir du grammaire , affichier les syntaxes grammaticaux de la phrase.
%%%%%%%%%%%%%%%%%%%%%%    Veuillez faire les tests séparament.

/*
%%%%%%%%%%%                             %%%%%%%%%%%%%
%%%%%%%%%%%     La première partie      %%%%%%%%%%%%%
%%%%%%%%%%%                             %%%%%%%%%%%%%


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

%%%%%%%%%%%%%%%                             Consignes
%%%%%%%%%%%%%%% Pour tester le grammaire ci-dessus , vous pouvez taper dans la ligne de commande de prolog
%%%%%%%%%%%%%%% "phs([mettez vos phrases à tester ici],[])." Par example
%%%%%%%%%%%%%%% phs([ce,ne,est,pas,une,conclusion,a_la_quelle,je,crois],[]).

%%%%%%%%%%%%%%% FIN DE LA PREMIERE PARTIE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

*/





/*
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

%%%%%%%%%%%%%%%                             Consignes
%%%%%%%%%%%%%%% Pour tester le grammaire ci-dessus , vous pouvez taper dans la ligne de commande de prolog
%%%%%%%%%%%%%%% "analyse(T,[mettez vos phrases à tester ici en séparant chaque mot par un ','],[])." Par example
%%%%%%%%%%%%%%% analyse(T,[ce,ne,est,pas,une,conclusion,a_la_quelle,je,crois],[]).

%%%%%%%%%%%%%%% FIN DE LA DEUXIEME PARTIE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MERCI POUR VOTRE ATTENTION , FIN DU PROJET  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Auteur: Yu Du                               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
