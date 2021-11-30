# Analiza ladijskih nesreč


## Tematika

V delu bom analiziral ladijske nasreče rekreativnih plovil v Ameriki. Glavni podatki so pridobljeni iz ameriške obalne straže leta 2020 <https://uscgboating.org/library/accident-statistics/Recreational-Boating-Statistics-2020.pdf>. Ker bom na določeni tabeli tega vira izvajal regresijsko analizo, je za dodatno spremenljivko dodan povprečen zaslužek državljana ZDA; podatek iz CSV: <https://fred.stlouisfed.org/series/A792RC0A052NBEA>.

Ker so podatki zelo monotoni, bom dodal še kratko analizo regate Volvo ocean race, kjer so podatki pridobljeni iz <https://en.wikipedia.org/wiki/The_Ocean_Race> ter <https://en.wikipedia.org/wiki/1985%E2%80%931986_Whitbread_Round_the_World_Race>.

## Spletna povezava do virov podatkov in grob opis podatkov izvlečenih tabel:

[2020 Recreational boating statistics](<https://uscgboating.org/library/accident-statistics/Recreational-Boating-Statistics-2020.pdf>)

[Pihodek v ZDA v letu 2020](<https://fred.stlouisfed.org/series/A792RC0A052NBEA>)

[The ocean race](<https://en.wikipedia.org/wiki/The_Ocean_Race>)
&#8195;
&#8195;
[The ocean race leta 1985/86](<https://en.wikipedia.org/wiki/1985%E2%80%931986_Whitbread_Round_the_World_Race>)

Podatki iz PDF bodo primarno obdelano z OCR orodji, ki nam bodo vrnila excelove tabele (z neštevilskimi tipi), ki jih bo treba ročno popravljati. Podatki bodo osmisleni kot:

1. TABELA: (Nesreče v posameznih mesecih)
<ol type="i">
  <li>Mesec                           (Faktor)	</li>
  <li>Smrtne nesreče                  (Število)	</li>
  <li>Nesmrtne nesreče                (Število)	</li>
  <li>Vse nesreče                     (Število)	</li>
  <li>Procent smrtnih nesreč          (Število)	</li>
  <li>Število smrti                   (Število)	</li>
</ol>

2. TABELA: (Nesreče v posameznih letih)
<ol type="i">
  <li>Leto                            (Število)	</li>
  <li>Smrtne nesreče                  (Število)	</li>
  <li>Nesmrtne nesreče                (Število)	</li>
  <li>Število vseh nesreč	      (Število)	</li>
</ol>

3. TABELA: (Nesreče v posamezni zvezni državi)
<ol type="i">
  <li>Zvezna država                   (Niz)	</li>
  <li>Vse nesreče                     (Število)	</li>
  <li>Smrtne nesreče                  (Število)	</li>
  <li>Nesreče s poškodbami	      (Število)	</li>
  <li>Nesreče le materialne škode     (Število)	</li>
  <li>Število smrti                   (Število)	</li>
  <li>Število ponesrečencev           (Število)	</li>
  <li>Škoda v USD                     (Število)	</li>
</ol>

4. TABELA: (Število registriranih plovil)
<ol type="i">
  <li>Leto        				(Število)	</li>
  <li>Število smrti   				(Število)	</li>
  <li>Število registriranih plovil    		(Število)	</li>
  <li>Delež smrtnih izidov    			(Število)	</li>
  <li>Število smrti v plovilih z motorjem   	(Število)	</li>
  <li>Število registriranih motornih plovil   	(Število)	</li>
  <li>Delež smrnih izidov z motornim plovilom   (Število)	</li>
</ol>

5. TABELA: (Prihodek državljana ZDA)
<ol type="i">
  <li>Leto    			(Število)	</li>
  <li>Povprečni prihodek    	(Število)	</li>
</ol>

6. TABELA: (Vzrok nesreč)
<ol type="i">
  <li>Vzrok   		(Niz)		</li>
  <li>Število nesreč    (Število)	</li>
  <li>Število smrti   	(Število)	</li>
  <li>Število poškodb   (Število)	</li>
  <li>Tip nesreče   	(Niz)		</li>
</ol>

7. TABELA: (Pregled regat Volvo ocean race)
<ol type="i">
  <li>Leto   			(Število)</li>
  <li>Klasa    			(Niz)</li>
  <li>Število kol   		(Število)</li>
  <li>Število kratkih podregat  (Število)</li>
  <li>Število prijavljenih ekip (Število)</li>
  <li>Kraj začetka   		(Niz)</li>
  <li>Kraj konca   		(Niz)</li>
  <li>Zmagovalna barka   	(Niz)</li>
  <li>Zmagovalni skipper   	(Niz)</li>
</ol>

8. TABELA: (Pregled regate Volvo ocean race leta 1985/86)
<ol type="i">
  <li>Kolo			(Niz)</li>
  <li>Datum začetka		(Datumski vektor)</li>
  <li>Kraj začetka   		(Niz)</li>
  <li>Kraj konca   		(Niz)</li>
  <li>Razdalja podregate	(Število)</li>
  <li>Zmagovalna ladja   	(Niz)</li>
  <li>Zemlj. dolžina začetka   	(Število)</li>
  <li>Zemlj. širina začetka   	(Število)</li>
  <li>Zemlj. dolžina konca   	(Število)</li>
  <li>Zemlj. širina konca   	(Število)</li>
</ol>

## Analiza podatkov
Opravljena bo linearna regresija števila smrti v odvisnosti od prihodka in števila registriranih plovil.
