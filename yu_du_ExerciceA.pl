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


% Exercice A :
% Pronoms relatifs sujets : lequel , laquelle , lesquels , lesquelles.

% Exemples des phrases :
% 1) il sait lequel de ces enfants a cassé la fenêtre.
% 2) ce est la voiture rouge avec laquelle elle est venue.
% 3) tuu peux effectivement voir les logiciels avec lesquels nous travaillons.
% 4) je ne sais pas lesquelles sont les tiennes parmis ces chaussettes.
% 5) tu preferes laquelle de ces bagues?
% 6) ce est un domaine dans laquelle il excelle.
% 7) ce est un domaine dans lequel il excelle.


% Les vocabulaires se trouve par la suite :

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

%%%%%%%%%%%%%%%                             Commentaires
%%%%%%%%%%%%%%% Pour tester le grammaire ci-dessus , vous pouvez taper dans la ligne de commande de prolog
%%%%%%%%%%%%%%% "phs([mettez vos phrases à tester ici],[])." L'example pour la première phrase "phs([il,sait,lequel,de,ces,enfants,a,casse,la,fenetre],[])."
%%%%%%%%%%%%%%% Faire attention aux caractères spécifiques comme é ê ç , le compilateur de prolog ne les reconnait pas
