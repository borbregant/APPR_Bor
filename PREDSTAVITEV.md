# Analiza ladijskih nesreč


## Tematika

V delu bom analiziral ladijske nasreče rekreativnih plovil v Ameriki. Glavni podatki so pridobljeni iz ameriške obalne straže leta 2020 <https://uscgboating.org/library/accident-statistics/Recreational-Boating-Statistics-2020.pdf>. Ker bom na določeni tabeli tega vira izvajal regresijsko analizo, je za dodatno spremenljivko dodan povprečen zaslužek državljana ZDA; podatek iz <https://fred.stlouisfed.org/series/A792RC0A052NBEA>.

Ker so podatki zelo monotoni, bom dodal še kratko analizo regate Volvo ocean race, kjer so podatki pridobljeni iz <https://en.wikipedia.org/wiki/The_Ocean_Race> ter <https://en.wikipedia.org/wiki/1985%E2%80%931986_Whitbread_Round_the_World_Race>.

# Spletna povezava do virov podatkov in grob opis podatkov izvlečenih tabel:

[2020 Recreational boating statistics](<https://uscgboating.org/library/accident-statistics/Recreational-Boating-Statistics-2020.pdf>)

[Pihodek v ZDA v letu 2020](<https://fred.stlouisfed.org/series/A792RC0A052NBEA>)

[The ocean race](<https://en.wikipedia.org/wiki/The_Ocean_Race>)
&#8195;
&#8195;
[The ocean race leta 1985/86](<https://en.wikipedia.org/wiki/1985%E2%80%931986_Whitbread_Round_the_World_Race>)

Podatki iz PDF bodo primarno obdelano z OCR orodji, ki nam bodo vrnila excelove tabele (z neštevilskimi tipi), ki jih bo treba ročno popravljati. Podatki bodo osmisleni kot:

1. TABELA: (Nesreče v posameznih mesecih)
<ol type="i">
  <li>Mesec                           (faktor)</li>
  <li>Smrtne nesreče                  (niz)</li>
  <li>Nesmrtne nesreče                (niz)</li>
  <li>Vse nesreče                     (niz)</li>
  <li>Procent smrtnih nesreč          (niz)</li>
  <li>Število smrti                   (stevilo)</li>
</ol>

2. TABELA: (Nesreče v posameznih letij)
<ol type="i">
  <li>Leto                            (stevilo)</li>
  <li>Smrtne nesreče                  (stevilo)</li>
  <li>Nesmrtne nesreče                (stevilo)</li>
  <li>Vse nesreče                     (stevilo)</li>
</ol>

3. TABELA: (Nesreče v posamezni zvezni državi)
<ol type="i">
  <li>Zvezna država                   (niz)</li>
  <li>Vse nesreče                     (stevilo)</li>
  <li>Smrtne nesreče                  (stevilo)</li>
  <li>Vse nesreče                     (stevilo)</li>
  <li>Oškodovani                      (stevilo)</li>
  <li>Število smrti                   (stevilo)</li>
  <li>Število ponesrečencev           (stevilo)</li>
  <li>Škoda v USD                     (stevilo)</li>
</ol>

4. TABELA: (Število registriranih plovil)
<ol type="i">
  <li>Leto        (stevilo)</li>
  <li>Število smrti   (stevilo)</li>
  <li>Število registriranih plovil    (stevilo)</li>
  <li>Delež smrtnih izidov    (stevilo)</li>
  <li>Število smrti v plovilih z motorjem   (stevilo)</li>
  <li>Število registriranih motornih plovil   (stevilo)</li>
  <li>Delež smrnih izidov z motornim plovilom   (stevilo)</li>
</ol>

5. TABELA: (Prihodek državljana ZDA)
<ol type="i">
  <li>Leto    (stevilo)</li>
  <li>Povprečni prihodek    (stevilo)</li>
</ol>

6. TABELA: (Vzrok nesreč)
<ol type="i">
  <li>Vzrok   (faktor)</li>
  <li>Število nesreč    (stevilo)</li>
  <li>Število smrti   (stevilo)</li>
  <li>Število poškodb   (stevilo)</li>
  <li>Tip nesreče   (niz)</li>
</ol>

7. TABELA: (Pregled regat Volvo ocean race)
<ol type="i">
  <li>Leto   (število)</li>
  <li>Klasa    (niz)</li>
  <li>Število kol   (stevilo)</li>
  <li>Število kratkih podregat   (stevilo)</li>
  <li>Število prijavljenih ekip   (število)</li>
  <li>Kraj začetka   (niz)</li>
  <li>Kraj konca   (niz)</li>
  <li>Zmagovalna barka   (niz)</li>
  <li>Zmagovalni skipper   (niz)</li>
</ol>

8. TABELA: (Pregled regate Volvo ocean race leta 1985/86)
<ol type="i">
  <li>Kolo   (niz)</li>
  <li>Datum začetka    (niz)</li>
  <li>Kraj začetka   (stevilo)</li>
  <li>Kraj konca   (stevilo)</li>
  <li>Razdalja   (število)</li>   <!--  NI OK KER NI TIDYDATA,,,, popravi uvoz -->
  <li>Zmagovalna ladja   (niz)</li>
  <li>Razdalja   (število)</li>
  <li>Zemlj. dolžina začetka   (število)</li>
  <li>Zemlj. širina začetka   (število)</li>
  <li>Zemlj. dolžina konca   (število)</li>
  <li>Zemlj. dolžina konca   (število)</li>
</ol>

Opravljena bo linearna regresija števila smrti v odvisnosti od
prihodka in števila registriranih plovil
