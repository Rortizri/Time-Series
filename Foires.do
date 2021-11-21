*****Do File Foires*****

****IMPORTER LA BASE DE DONNÉES****




*****STATISTIQUES DESCRIPTIVES******

tabstat cebollalp pollolp papalp zanahlp tomatlp


   stats |  ceboll~p   pollolp    papalp   zanahlp   tomatlp
---------+--------------------------------------------------
    mean |  31.96963  13.49746  50.29285  36.45356  2.367018
------------------------------------------------------------
sum cebollalp pollolp papalp zanahlp tomatlp

*On peut apprecier ici les statistiques des variables que nous allons analiser.
*Ici le moyen represent le prix en KG de chaque produit (Oignon, Poulet, pomme de terre, carotte et tomate) respectivement.

sum cebollalp pollolp papalp zanahlp tomatlp liqf


    Variable |       Obs        Mean    Std. Dev.       Min        Max
-------------+--------------------------------------------------------
   cebollalp |       379    31.96963    6.722427      20.83      60.42
     pollolp |       236    13.49746    1.119023      11.17       15.8
      papalp |       379    50.29285    9.942877         36         75
     zanahlp |       379    36.45356    6.189695         25      60.42
     tomatlp |       379    2.367018    .5042878        1.5        4.5
-------------+--------------------------------------------------------
        liqf |       413    8574.913    2832.885       2624      16701

*Le tableau montre la variation du prix des produits, on peut constater que le produit le plus cher c'est la pomme de terre.
*Cependant le produit qui a eu la variation la plus eleve c'est l'oignon. 

gen inf=((0.61*cebollalp +1.62*pollolp+ 1.99*papalp +0.44*zanahlp+ 0.49*tomatlp)/5) 
reg inf liqf

      Source |       SS       df       MS              Number of obs =     236
-------------+------------------------------           F(  1,   234) =   36.73
       Model |  431.313319     1  431.313319           Prob > F      =  0.0000
    Residual |  2747.97621   234  11.7434881           R-squared     =  0.1357
-------------+------------------------------           Adj R-squared =  0.1320
       Total |  3179.28953   235  13.5288916           Root MSE      =  3.4269

------------------------------------------------------------------------------
         inf |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
        liqf |   .0008611   .0001421     6.06   0.000     .0005812     .001141
       _cons |   27.36349   .9980653    27.42   0.000     25.39715    29.32983
------------------------------------------------------------------------------


reg inf liqf BC TDC
ssc install outreg2


      Source |       SS           df       MS      Number of obs   =       236
-------------+----------------------------------   F(2, 233)       =     19.80
       Model |  461.945023         2  230.972512   Prob > F        =    0.0000
    Residual |  2717.34451       233  11.6624228   R-squared       =    0.1453
-------------+----------------------------------   Adj R-squared   =    0.1380
       Total |  3179.28953       235  13.5288916   Root MSE        =     3.415

------------------------------------------------------------------------------
         inf |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
        liqf |    .000902   .0001438     6.27   0.000     .0006186    .0011853
          BC |  -.1508338   .0930695    -1.62   0.106     -.334199    .0325315
       _cons |   26.65892   1.085476    24.56   0.000     24.52032    28.79753
------------------------------------------------------------------------------

outreg2 using reg.doc

reg inf liqf ferialp BC TDC


      Source |       SS           df       MS      Number of obs   =       236
-------------+----------------------------------   F(3, 232)       =     15.58
       Model |  533.124103         3  177.708034   Prob > F        =    0.0000
    Residual |  2646.16543       232  11.4058855   R-squared       =    0.1677
-------------+----------------------------------   Adj R-squared   =    0.1569
       Total |  3179.28953       235  13.5288916   Root MSE        =    3.3773

------------------------------------------------------------------------------
         inf |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
        liqf |   .0008499   .0001438     5.91   0.000     .0005666    .0011331
     ferialp |   3.067229   1.227819     2.50   0.013     .6481275     5.48633
          BC |  -.1457254   .0920629    -1.58   0.115    -.3271116    .0356608
         TDC |          0  (omitted)
       _cons |   26.92622   1.078791    24.96   0.000     24.80074     29.0517


gen iferia = inf*ferialp

reg liqf iferia BC TDC


      Source |       SS           df       MS      Number of obs   =       236
-------------+----------------------------------   F(2, 233)       =      6.30
       Model |  29847417.7         2  14923708.8   Prob > F        =    0.0022
    Residual |   551859026       233  2368493.67   R-squared       =    0.0513
-------------+----------------------------------   Adj R-squared   =    0.0432
       Total |   581706444       235  2475346.57   Root MSE        =      1539

------------------------------------------------------------------------------
        liqf |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      iferia |   33.35414   14.85684     2.25   0.026     4.083234    62.62505
          BC |   113.1436   41.29167     2.74   0.007     31.79086    194.4964
         TDC |          0  (omitted)
       _cons |   7123.107   154.6406    46.06   0.000     6818.435     7427.78
------------------------------------------------------------------------------



****GÉNÉRATION DE NOUVELLES VARIABLES****

*Inflation des produits alimentaires*

gen inf=((0.61*cebollalp +1.62*pollolp+ 1.99*papalp +0.44*zanahlp+ 0.49*tomatlp)/5) 

*Transformation des variables en logarithme neperiane*

gen lnpollo= ln(pollolp)
gen lncebolla= ln(cebollalp)
gen lnpapa= ln(papalp)
gen lnzaho= ln(zanahlp)
gen lntomat= ln(tomatlp)
gen lnliqf= ln(liqf)
gen linf= ln(inf)

****REGRESSIONS DU MODÈLE****

reg inf liqf


gen linfl= ln(inf)
gen l= ln(liqf)
reg linfl l


      Source |       SS       df       MS              Number of obs =     236
-------------+------------------------------           F(  1,   234) =   32.14
       Model |  .358318675     1  .358318675           Prob > F      =  0.0000
    Residual |  2.60906104   234  .011149834           R-squared     =  0.1208
-------------+------------------------------           Adj R-squared =  0.1170
       Total |  2.96737971   235  .012627148           Root MSE      =  .10559

------------------------------------------------------------------------------
       linfl |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
           l |   .1417698   .0250082     5.67   0.000     .0924997    .1910398
       _cons |   2.250785   .2201374    10.22   0.000     1.817081     2.68449
------------------------------------------------------------------------------

reg inf liqf TDC BC

reg infl liqf TDC BC



****SÉRIE TEMPORELLE****

tsset idt
var lniqfl lnpollo lncebolla lnpapa lnzaho lntomat 


*Correlogram*

corrgram lnpollo, lags(14)
corrgram lncebolla, lags(14)
corrgram lnpapa, lags(14)
corrgram lnzaho, lags(14)
corrgram lniqfl, lags(14)
corrgram linf, lags(14)


*Transformation des variables en différences*


gen papa1 = d.papalp
gen pollo1 = d.pollolp
gen cebolla1 = d.cebollalp
gen zanah1 = d.zanahlp 
gen tomate1 = d.tomatlp
gen infl1 = d.inf
gen liqf1= d.liqf


gen papa20 = d20.papalp
gen pollo20 = d20.pollolp
gen cebolla20 = d20.cebollalp
gen zanah20 = d20.zanahlp 
gen toma20 = d20.tomatlp
gen inf20 = d20.inf
gen liqf20 = d20.liqf


gen po2= d.lnpollo
gen ce2= d.lncebolla
gen pa2= d.lnpapa
gen zana2= d.lnzaho
gen tomat2= d.lntomat
gen inf2= d.linf
gen li2= d.lnliqf


gen po3= d3.lnpollo
gen ce3= d3.lncebolla
gen pa3= d3.lnpapa
gen zana3= d3.lnzaho
gen toma3= d3.lntomat
gen inf3= d3.linf
gen li3= d3.lnliqf


gen po10= d10.lnpollo
gen ce10= d10.lncebolla
gen pa10= d10.lnpapa
gen zana10= d10.lnzaho
gen toma10= d10.lntomat
gen inf10= d10.linf
gen li10= d10.lnliqf


gen po20= d20.lnpollo
gen ceb20= d20.lncebolla
gen pa20= d20.lnpapa
gen zana20= d20.lnzaho
gen toma20= d20.lntomat
gen inf20= d20.linf
gen li20= d20.lnliqf




*Modèle VAR*


varsoc li20 inf20, maxlag(14)
varsoc li20 pa20, maxlag(14)
varsoc li20 ceb20, maxlag(14)
varsoc li20 po20, maxlag(14)
varsoc li20 zana20, maxlag(14)
varsoc li20 toma20, maxlag(14)



*Test de qualité d'ajustement*

*Stationnarité du modèle*


dfuller liqf
dfuller pollolp
dfuller papalp
dfuller zanahlp
dfuller cebollalp
dfuller inf



*comme il n'y a pas de stationnarité, il faut travailler sur les différences*


dfuller papa1
dfuller pollo1
dfuller cebolla1
dfuller zanah1
dfuller tomate1
dfuller infl1
dfuller liqf1

 
dfuller papa20 
dfuller pollo20 
dfuller cebolla20 
dfuller zanah20  
dfuller toma20 
dfuller inf20 
dfuller liqf20


*Avec les différences, nous pouvons assurer la stationnarité, 
*et ainsi poursuivre l'analyse

*Test de Cointégration Johansen*



*Le test de cointégration de Johansen se fait à partir des boutons Stata, 
*on doit cliquer sur statistiques > séries chronologiques multivariées > 
*rang de cointégration, puis choisir les variables que vous souhaitez tester.

H0: aucune équation de cointégration
H1: H0 n'est pas vrai


Trend: constant                                         Number of obs =     222
Sample:  192 - 413                                               Lags =      14
-------------------------------------------------------------------------------
                                                         5%
maximum                                      trace    critical
  rank    parms       LL       eigenvalue  statistic    value
    0      54       869.5024           .      6.9695*   15.41
    1      57      872.50475     0.02669      0.9648     3.76
    2      58      872.98713     0.00434
-------------------------------------------------------------------------------
                                                         5%
maximum                                       max     critical
  rank    parms       LL       eigenvalue  statistic    value
    0      54       869.5024           .      6.0047    14.07
    1      57      872.50475     0.02669      0.9648     3.76
    2      58      872.98713     0.00434
-------------------------------------------------------------------------------

*Nous pouvons voir qu'il n'y a pas de cointégration de la série, il n'est donc 
*pas nécessaire de faire un modèle vectoriel de correction d'erreur, le modèle 
*à utiliser est un VAR.


*Test de stabilité du modèle VAR*


var li20 pa20
varstable

   Eigenvalue stability condition
  +----------------------------------------+
  |        Eigenvalue        |   Modulus   |
  |--------------------------+-------------|
  |   .9145674               |   .914567   |
  |   .8024894               |   .802489   |
  |   .1346773               |   .134677   |
  | -.01671512               |   .016715   |
  +----------------------------------------+
   All the eigenvalues lie inside the unit circle.
   VAR satisfies stability condition.
   
var li20 ceb20 
varstable

 Eigenvalue stability condition
  +----------------------------------------+
  |        Eigenvalue        |   Modulus   |
  |--------------------------+-------------|
  |    .927321               |   .927321   |
  |   .8501776               |   .850178   |
  |  .03305283 +  .1543099i  |    .15781   |
  |  .03305283 -  .1543099i  |    .15781   |
  +----------------------------------------+
   All the eigenvalues lie inside the unit circle.
   VAR satisfies stability condition.



var li20 zana20 
varstable

 Eigenvalue stability condition
  +----------------------------------------+
  |        Eigenvalue        |   Modulus   |
  |--------------------------+-------------|
  |   .8969648               |   .896965   |
  |   .8313242               |   .831324   |
  |   .1457129               |   .145713   |
  | -.05343784               |   .053438   |
  +----------------------------------------+
   All the eigenvalues lie inside the unit circle.
   VAR satisfies stability condition.



var li20 toma20
varstable


  Eigenvalue stability condition
  +----------------------------------------+
  |        Eigenvalue        |   Modulus   |
  |--------------------------+-------------|
  |   .9336858               |   .933686   |
  |    .805514               |   .805514   |
  |   .1547961               |   .154796   |
  |  .05672202               |   .056722   |
  +----------------------------------------+
   All the eigenvalues lie inside the unit circle.
   VAR satisfies stability condition.

var li20 po20
varstable
   
 Eigenvalue stability condition
  +----------------------------------------+
  |        Eigenvalue        |   Modulus   |
  |--------------------------+-------------|
  |   .9117601               |    .91176   |
  |   .7921686               |   .792169   |
  |   .1489825               |   .148983   |
  | -.01355293               |   .013553   |
  +----------------------------------------+
   All the eigenvalues lie inside the unit circle.
   VAR satisfies stability condition.

*Il est possible d'observer que les valeurs propres (Eigenvalue) sont 
*dans le cercle racine unitaire, lE VAR est stable



*Test de normalité des erreurs*

var li20 pa20
varnorm, jbera

 Jarque-Bera test
  +--------------------------------------------------------+
  |           Equation |            chi2   df  Prob > chi2 |
  |--------------------+-----------------------------------|
  |               li20 |          1322.923  2    0.00000   |
  |               pa20 |          4997.836  2    0.00000   |
  |                ALL |          6320.759  4    0.00000   |


var li20 ceb20 
varnorm, jbera 
  
  Jarque-Bera test
  +--------------------------------------------------------+
  |           Equation |            chi2   df  Prob > chi2 |
  |--------------------+-----------------------------------|
  |               li20 |          1553.792  2    0.00000   |
  |              ceb20 |          410.413   2    0.00000   |
  |                ALL |          1964.205  4    0.00000   |
  +--------------------------------------------------------+

 
var li20 zana20
varnorm, jbera 


  Jarque-Bera test
  +--------------------------------------------------------+
  |           Equation |            chi2   df  Prob > chi2 |
  |--------------------+-----------------------------------|
  |               li20 |          1464.602  2    0.00000   |
  |             zana20 |          1018.904  2    0.00000   |
  |                ALL |          2483.506  4    0.00000   |
  +--------------------------------------------------------+
    
  
var li20 toma20
varnorm, jbera

   Jarque-Bera test
  +--------------------------------------------------------+
  |           Equation |            chi2   df  Prob > chi2 |
  |--------------------+-----------------------------------|
  |               li20 |          1360.285  2    0.00000   |
  |             toma20 |          707.218   2    0.00000   |
  |                ALL |          2067.502  4    0.00000   |
  +--------------------------------------------------------+


var li20 po20
varnorm, jbera 

 Jarque-Bera test
  +--------------------------------------------------------+
  |           Equation |            chi2   df  Prob > chi2 |
  |--------------------+-----------------------------------|
  |               li20 |          1345.987  2    0.00000   |
  |               po20 |          5056.487  2    0.00000   |
  |                ALL |          6402.474  4    0.00000   |
  +--------------------------------------------------------+


  
 *On peut voir que les erreurs suivent une distribution normale
 
 *Lagrange Multiplier Test*
 
*La dernière étape consiste à prouver la non-existence d'autocorrélation 
*du modèle, avec le test du multiplicateur de Lagrange. 



var li20 pa20
varlmar, mlag(14)

   Lagrange-multiplier test
  +--------------------------------------+
  | lag  |      chi2    df   Prob > chi2 |
  |------+-------------------------------|
  |   1  |   16.4468     4     0.00247   |
  |   2  |   15.7503     4     0.00337   |
  |   3  |    2.4876     4     0.64685   |
  |   4  |    3.3672     4     0.49835   |
  |   5  |    1.7346     4     0.78443   |
  |   6  |   13.0929     4     0.01083   |
  |   7  |    9.5877     4     0.04798   |
  |   8  |    1.9443     4     0.74600   |
  |   9  |    1.5578     4     0.81636   |
  |  10  |   16.3138     4     0.00263   |
  |  11  |    1.8825     4     0.75735   |
  |  12  |    2.7073     4     0.60793   |
  |  13  |    1.2609     4     0.86798   |
  |  14  |    1.1218     4     0.89080   |
  +--------------------------------------+
   H0: no autocorrelation at lag order



var li20 ceb20 
varlmar, mlag(14)

 Lagrange-multiplier test
  +--------------------------------------+
  | lag  |      chi2    df   Prob > chi2 |
  |------+-------------------------------|
  |   1  |    4.5963     4     0.33128   |
  |   2  |   14.0893     4     0.00702   |
  |   3  |    4.9682     4     0.29057   |
  |   4  |    2.8393     4     0.58506   |
  |   5  |    6.7033     4     0.15242   |
  |   6  |    3.6440     4     0.45632   |
  |   7  |    4.1388     4     0.38755   |
  |   8  |    5.0678     4     0.28041   |
  |   9  |    3.2578     4     0.51565   |
  |  10  |    7.1363     4     0.12886   |
  |  11  |    7.4316     4     0.11476   |
  |  12  |    1.9472     4     0.74546   |
  |  13  |    6.1775     4     0.18628   |
  |  14  |    4.8202     4     0.30625   |
  +--------------------------------------+
   H0: no autocorrelation at lag order


var li20 zana20
varlmar, mlag(14)

 Lagrange-multiplier test
  +--------------------------------------+
  | lag  |      chi2    df   Prob > chi2 |
  |------+-------------------------------|
  |   1  |   18.6834     4     0.00091   |
  |   2  |   19.7691     4     0.00055   |
  |   3  |    1.7067     4     0.78950   |
  |   4  |    5.5803     4     0.23276   |
  |   5  |    8.5704     4     0.07278   |
  |   6  |    3.5472     4     0.47073   |
  |   7  |    7.1926     4     0.12605   |
  |   8  |    2.2374     4     0.69219   |
  |   9  |   17.5239     4     0.00153   |
  |  10  |   17.4974     4     0.00155   |
  |  11  |    9.8802     4     0.04249   |
  |  12  |    1.1447     4     0.88712   |
  |  13  |    0.8864     4     0.92650   |
  |  14  |   12.1050     4     0.01659   |
  +--------------------------------------+
   H0: no autocorrelation at lag order



var li20 toma20
varlmar, mlag(14)


   Lagrange-multiplier test
  +--------------------------------------+
  | lag  |      chi2    df   Prob > chi2 |
  |------+-------------------------------|
  |   1  |   19.0833     4     0.00076   |
  |   2  |   19.3360     4     0.00068   |
  |   3  |    5.8965     4     0.20701   |
  |   4  |    1.9345     4     0.74780   |
  |   5  |    7.4364     4     0.11455   |
  |   6  |    4.5116     4     0.34117   |
  |   7  |    7.5818     4     0.10816   |
  |   8  |    5.5800     4     0.23278   |
  |   9  |    2.5537     4     0.63504   |
  |  10  |   10.7088     4     0.03004   |
  |  11  |    7.0686     4     0.13231   |
  |  12  |    4.9028     4     0.29741   |
  |  13  |    8.2359     4     0.08331   |
  |  14  |    3.7096     4     0.44674   |
  +--------------------------------------+




var li20 po20
varlmar, mlag(14)
  Lagrange-multiplier test
  +--------------------------------------+
  | lag  |      chi2    df   Prob > chi2 |
  |------+-------------------------------|
  |   1  |   17.8455     4     0.00132   |
  |   2  |   18.2509     4     0.00110   |
  |   3  |    4.0130     4     0.40425   |
  |   4  |    2.2881     4     0.68293   |
  |   5  |    1.5873     4     0.81108   |
  |   6  |    6.5703     4     0.16041   |
  |   7  |    4.3622     4     0.35920   |
  |   8  |    5.1447     4     0.27277   |
  |   9  |    4.7685     4     0.31189   |
  |  10  |   13.1539     4     0.01055   |
  |  11  |    0.9344     4     0.91957   |
  |  12  |    1.3885     4     0.84619   |
  |  13  |    0.7088     4     0.95024   |
  |  14  |    0.4236     4     0.98050   |
*Il est possible d'observer qu'il n'y a pas d'autocorrélation

  
*IMPULSE RESPONSE FUNCTIONS (IRFs)*


qui var li20 pa20, lags(1/7) exog(ferialp)
irf create order1, step(14) set(myirf1, replace)
irf graph dm, impulse(ferialp) response(pa20)

qui var li20 ceb20, lags(1/7) exog(ferialp)
irf create order1, step(14) set(myirf1, replace)
irf graph dm, impulse(ferialp) response(ceb20)


qui var li20 zana20, lags(1/7) exog(ferialp)
irf create order1, step(14) set(myirf1, replace)
irf graph dm, impulse(ferialp) response(zana20)


qui var li20 toma20, lags(1/7) exog(ferialp)
irf create order1, step(14) set(myirf1, replace)
irf graph dm, impulse(ferialp) response(toma20)

qui var li20 po20, lags(1/7) exog(ferialp)
irf create order1, step(14) set(myirf1, replace)
irf graph dm, impulse(ferialp) response(po20)



*Granger Test*

gen inf20 = d20.inf

qui var lnliqf linf, lags(1/28)
vargranger


 Granger causality Wald tests
  +------------------------------------------------------------------+
  |          Equation           Excluded |   chi2     df Prob > chi2 |
  |--------------------------------------+---------------------------|
  |              li20              inf20 |  26.576    22    0.228    |
  |              li20                ALL |  26.576    22    0.228    |
  |--------------------------------------+---------------------------|
  |             inf20               li20 |  59.396    28    0.000    |
  |             inf20                ALL |  59.396    28    0.000    |
  +------------------------------------------------------------------+

qui var linf lnliqf, lags(1/28)
vargranger
  
Granger causality Wald tests
  +------------------------------------------------------------------+
  |          Equation           Excluded |   chi2     df Prob > chi2 |
  |--------------------------------------+---------------------------|
  |              li20              inf20 |  26.576    22    0.228    |
  |              li20                ALL |  26.576    22    0.228    |
  |--------------------------------------+---------------------------|
  |             inf20               li20 |  59.396    28    0.000    |
  |             inf20                ALL |  59.396    28    0.000    |
  +------------------------------------------------------------------+



