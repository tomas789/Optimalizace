Domaci uloha z predmetu Optimalizacni metody
============================================

Pruvodni email
--------------
Pratele,

na zaverecnem priklade urcenem k provereni vasich praktickych znalosti jsem vyuzil celkem dost napadu. Proto se nesnazte o pouhe zapsani linearni programu a jeho prime reseni (pravdepodobne byste jej ani nedostali), ale snazte se pouzivat sve znalosti (pokud mozno i z jinych predmetu). Reseni podavejte se vsemi chlupy, idealne jako .tgz soubor s popisem reseni, postupem a okomentovanym resenim. Zadani naleznete v priloze e-mailu. Data (tj. potrebna omezeni) naleznete na mych strankach -- http://kam.mff.cuni.cz/~knop/vyuka/optimed/zadaniX.tgz -- kde X nahradte treti cislici vaseho cisla osoby na UK modulo 5.

Uvedomte si take, prosim, ze priklad je velky a u takoveho nelze ocekavat jeho kontrolu behem chvilky. Nenechavejte tedy body zapocet na posledni chvili!

Dusan

Jak se to spusti (email)
------------------------
Ahoj,

posilam vypracovani tretiho ukolu z optimalizace. Funguje to takhle

1/ Necim jako g++ -o convert zadani.cpp zkompilovat .cpp soubor
2/ ./convert cr1.txt ct.txt pripravit soubor cr.txt a obdobne pro eu ./convert eu1.txt eu.txt
3/ V run.m editovat cestu k souborum cr.txt a eu.txt
4/ Spustit run.m (Matlab)

Cely skript funguje tak, ze nacte vstup a udela tri varianty. Prvni s castkou 3 000 000 Kc, druhou bez omezeni CR a treti bez omezeni EU. Z nich vybere tu s nejmensi fitness (je to minimalizace - koeficienty ucelove funkce jsou prenasobene -1), prida k ni omezeni zisku na rovnost toho co jsem vypocital puvodne a udelam novou ucelovou funkci minimalizujici plochu osetou vybranymi plodinami.

Skript jsem odzkousel pro mensi vstupy a fungoval dobre. Neprikladam ale spocitane reseni, protoze nemam v pocitaci dost pameti aby to proslo. Precijen tech dat je mnoho. To cpp je tam proto, abych se nemusel otravovat s nacitanim promenlive dlouhych radku v Matlabu, tak jsem to sfouknul v C++ ve kterem je to pro me jednodussi. Vystup toho je v podstate matice \in {0,1}^{N x 22} a vektor \in {R}^{N}.

Mohl bych taky vedet kolik bodu jsem prosim dostal za test cislo 3? V tabulce to neni napsane a ja si nepamatuju jestli si to uz daval nebo ne. Diky.

Tomas K.
