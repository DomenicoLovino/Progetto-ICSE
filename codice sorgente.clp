(defglobal ?*metaId*  = 0)
(defglobal ?*attributoId*  = 0)

; ***********************************************************
; *VARIABILE GLOBALE UTILE UTILE PER STRAMPARE I RISULTATI  *
; ***********************************************************

(defrule Presentazione
        (declare (salience 100))
		
        =>
        (printout t crlf crlf)
        (printout t "*************************************************************************************************" crlf)
		(printout t "*                                                                                               *" crlf)
		(printout t "*  Questo sistema esperto ti suggerira' i luoghi da visitare durante la tua prossima vacanza    *" crlf)
        (printout t "*                   nella provincia BAT che piu' si adattano alle tue esigenze                  *" crlf)
		(printout t "*                                                                                               *" crlf)
		(printout t "*************************************************************************************************" crlf)
		(printout t crlf)
		(printout t "                                 Oggi e' il " (getDay) "/" (getMonth) "/" (getYear) crlf crlf)
        (assert (mese (getMonth)))
)

;***********************
;template per meta
;***********************
(deftemplate meta
	(slot nome)
	(slot indirizzo)
	(slot contatti)
	(slot tipo)
	(slot disabili)
	(slot ospedale)
	(slot animali)
	(multislot varie)
	(slot bus)
	(slot treno)
	(multislot eta (allowed-symbols bambini giovani anziani tutti))
	(slot cf (type FLOAT )(default 0.0))
	(slot lat (type FLOAT) )
	(slot lon (type FLOAT))	
	(slot descrizione)	
)

;*************************
;template struttura alberghiere
;************************
(deftemplate struttura
	(slot nome )
	(slot indirizzo)
	(slot tipo)
	(slot lat (type FLOAT) )
	(slot lon (type FLOAT) )
	(slot stelle (default 6))
	(slot wifi)
	(slot piscina)
	(slot spa)
	(slot parcheggio)
	(slot animali)
	(slot palestra)
	(slot babysitter)
	(slot citta)
	(slot treno)
	(slot bus)
	(slot cf (type FLOAT) (default 0.0))
)

(deftemplate city
	(slot nome)
	(slot lat (type FLOAT))
	(slot lon (type FLOAT))
	(multislot mezzi)
)	


(defrule assert-meta
	(declare (salience 100))
	=>
	(assert (meta
				(nome "Castel del Monte")
				(indirizzo " Nei pressi della ss170 dir a(Andria)")
				(contatti " 0883.569997,pm-pug.casteldelmonte@beniculturali.it,facebook:  Castel del Monte - Polo Museale della Puglia")
				(tipo castello)
				(disabili no)
				(ospedale no)
				(animali no)
				(bus si)
				(treno no)
				(eta tutti)
				(varie normanno)
				(lat 41.085716)	
				(lon 16.271118)
				(descrizione "http://www.casteldelmonte.beniculturali.it/")
		)
	)
	
	(assert (meta
				(nome "Riserva naturale Saline di Margherita di Savoia")
				(indirizzo "SP141(Margherita di Savoia)")
				(contatti "+39 0883 657519")
				(tipo parco_naturale)
				(disabili si)
				(ospedale no)
				(animali si)
				(bus si)
				(treno no)
				(eta bambini)
				(varie )
				(lat 41.426361)
				(lon 16.018837)
				(descrizione "http://www.margheritadisavoia.com/la-salina/")
		)
	)
	
	(assert (meta
				(nome "Cattedrale di Trani")
				(indirizzo " Via Reginaldo Giuseppe Maria Addazi 1(Trani)")
				(contatti "+39 0883 500293")
				(tipo chiesa)
				(disabili si)
				(ospedale si)
				(animali no)
				(bus si)
				(treno si)
				(varie romanico)
				(eta anziani)
				(lat 41.281926)
				(lon 16.418045)
				(descrizione "http://www.cattedraletrani.it/IT/")
		)
	)
	(assert (meta
				(nome "Museo del confetto")
				(indirizzo "Via Museo del Confetto 12(Andria)")
				(contatti "+39 0883 591871")
				(tipo museo)
				(disabili si)
				(ospedale si)
				(animali no)
				(bus si)
				(treno si)
				(varie agroalimentare)
				(eta tutti)
				(lat 41.226148)
				(lon 16.295318)
				(descrizione "https://www.museodelconfetto.it/")
			)	
	)
	
	(assert (meta
				(nome "Lido delle Rose")
				(indirizzo "Lungomare Cristoforo Colombo(Margherita Di Savoia)")
				(contatti "+39 0883 657252")
				(tipo spiaggia)
				(disabili si)
				(ospedale si)
				(animali si)
				(bus si)
				(treno no)
				(eta bambini anziani)
				(varie sabbia lido_attrezzato animazione-anziani)
				(lat 41.372742)
				(lon 16.156956)
				(descrizione "http://www.lidodellerose.altervista.org/")
			)
	)
	
	(assert (meta
				(nome "Lido Copacabana")
				(indirizzo "Lungomare Cristoforo Colombo(Margherita Di Savoia)")
				(contatti "+39 333 412 3192")
				(tipo spiaggia)
				(disabili si)
				(ospedale si)
				(animali si)
				(bus si)
				(treno no)
				(eta bambini giovani )
				(varie sabbia lido_attrezzato movida)
				(lat 41.372742)
				(lon 16.156956)
				(descrizione "http://www.copacabanasuite.com/")
			)
	)
	
	(assert (meta
				(nome "Terme di Margherita di Savoia")
				(indirizzo "Piazza Liberta' 1, Margherita di Savoia")
				(contatti "+39 0883 655402")
				(tipo centro_benessere)
				(disabili si)
				(ospedale si)
				(animali no)
				(bus si)
				(treno no)
				(eta bambini anziani)
				(varie )
				(lat 41.372742)
				(lon 16.156956)
				(descrizione "http://www.termemargherita.it/it")
			)
	)
		(assert (meta
				(nome "Gocce di Benessere")
				(indirizzo "Via Martiri di via Fari 31 (Bisceglie)")
				(contatti "+39 080 972 2892")
				(tipo centro_benessere)
				(disabili si)
				(ospedale si)
				(animali no)
				(bus si)
				(treno si)
				(eta bambini anziani)
				(varie )
				(lat 41.235243) 
				(lon 16.513923)
				(descrizione "http://www.goccedibenessere.net/regalati/")
			)
	)
	
			(assert (meta
				(nome "Il tempio delle crisalidi")
				(indirizzo "Corso Vittorio Emanuele 65, (Spinazzola)")
				(contatti "349 376 5093")
				(tipo centro_benessere)
				(disabili si)
				(ospedale si)
				(animali no)
				(bus si)
				(treno no)
				(eta bambini anziani)
				(varie )
				(lat 40.970578) 
				(lon 16.086016)
				(descrizione "\"https://www.facebook.com/Il-tempio-delle-crisalidi-913793665317279/?rf=327627843914847\" ")
			)
	)
	
			(assert (meta
				(nome "Acquamadre day SPA")
				(indirizzo "Via S. Mercuro, 6(Bisceglie)")
				(contatti "n.d.")
				(tipo centro_benessere)
				(disabili si)
				(ospedale si)
				(animali no)
				(bus si)
				(treno si)
				(eta bambini anziani)
				(varie )
				(lat 41.228835) 
				(lon 16.487906)
				(descrizione "http://www.acquamadrespa.it/shopping/")
			)
	)
	
			(assert (meta
				(nome "Centro Benessere Anthos")
				(indirizzo "Via Prascina 9b(Barletta)")
				(contatti "n.d.")
				(tipo centro_benessere)
				(disabili si)
				(ospedale si)
				(animali no)
				(bus si)
				(treno si)
				(eta bambini anziani)
				(varie )
				(lat 41.322033)
				(lon 16.275338)
				(descrizione "\"http://anthos.mybestshops.it/index.php?pag=index\" ")
			)
	)
	
	
	(assert (meta
				(nome "Centro Benessere Venere")
				(indirizzo "Via Goffredo Mameli (Ruvo)")
				(contatti "n.d.")
				(tipo centro_benessere)        
				(disabili si)
				(ospedale si)
				(animali no)
				(bus si)
				(treno si)
				(eta bambini anziani)
				(varie )
				(lat 41.119066) 
				(lon 16.477258)
				(descrizione "https://www.facebook.com/venerebenessereRuvo/")
			)
	)
	
	(assert (meta
				(nome "Lido Salsello")
				(indirizzo "Via Vito Siciliani 41-42(Bisceglie)")
				(contatti "080 395 5953")
				(tipo spiaggia)
				(disabili si)
				(ospedale si)
				(animali si)
				(bus si)
				(treno si)
				(eta tutti)
				(varie roccia lido_attrezzato)
				(lat 41.250152)
				(lon 16.491029)
				(descrizione "http://www.hotelsalsello.it/it/lido/")
			)
	)
	
	(assert (meta
				(nome "Spiaggia libera di levante")
				(indirizzo "Viale Regine Elena(Barletta)")
				(contatti "n.d.")
				(tipo spiaggia)
				(disabili si)
				(ospedale si)
				(animali si)
				(bus si)
				(treno si)
				(eta tutti)
				(varie spiagge_libere sabbia)
				(lat 41.321578)
				(lon 16.294705)
				(descrizione "https://www.paesionline.it/italia/spiagge-barletta/spiaggia")
			)
	)
	
	(assert (meta
				(nome "Lido Brigantino")
				(indirizzo "Viale Regine Elena(Barletta)")
				(contatti "0883 533345")
				(tipo spiaggia)
				(disabili si)
				(ospedale si)
				(animali si)
				(bus si)
				(treno si)
				(eta tutti)
				(varie lido_attrezzato sabbia)
				(lat 41.321578)
				(lon 16.294705)
				(descrizione "http://www.brigantino.it/")
			)
	)
	
	(assert (meta
				(nome "Seconda Spiaggia")
				(indirizzo "Via Prussiano(Bisceglie)")
				(contatti "n.d.")
				(tipo spiaggia)
				(disabili si)
				(ospedale si)
				(animali si)
				(bus si)
				(treno si)
				(eta giovani anziani)
				(varie roccia spiagge_libere)
				(lat 41.242632) 
				(lon 16.513819)
				(descrizione "\"https://www.google.it/maps/place/Seconda+Spiaggia/@41.2426124,16.5120891,17z/data=!3m1!4b1!4m5!3m4!1s0x1338077261ee5a3b:0x7a2e82b8d7d8ce46!8m2!3d41.2426124!4d16.5142778\" ")
			
			)
	)
	
	
	(assert (meta
				(nome "Lido Pascia'")
				(indirizzo "Lungomare Pietro Mennea(Barletta)")
				(contatti "340 335 8123")
				(tipo spiaggia)
				(disabili si)
				(ospedale si)
				(animali si)
				(bus si)
				(treno si)
				(eta giovani bambini)
				(varie sabbia lido_attrezzato movida)
				(lat 41.323342) 
				(lon 16.278232)
				(descrizione "https://www.facebook.com/SummerCafeLidoPascia/")
			)
	)
	
	(assert (meta
				(nome "Lido Que Cuba'")
				(indirizzo "Lungomare Pietro Mennea (Barletta)")
				(contatti "n.d.")
				(tipo spiaggia)
				(disabili si)
				(ospedale si)
				(animali si)
				(bus si)
				(treno si)
				(eta anziani bambini)
				(varie sabbia lido_attrezzato  animazione-anziani)
				(lat 41.326912) 
				(lon 16.264639)
				(descrizione "https://www.facebook.com/Que-Cuba-173891932672673/")
			)
	)
	
	
	(assert (meta
				(nome "Porto di Trani")
				(indirizzo "Via Statuti Marini(Trani)")
				(contatti "n.d.")
				(tipo centro_storico )
				(disabili si )
				(ospedale si )
				(animali si)
				(bus si )
				(treno si)
				(eta tutti)
				(varie movida )
				(lat 41.279014)
				(lon 16.422750)	
				(descrizione "https://www.tripadvisor.it/Attraction_Review-g608901-d11742893-Reviews-Porto-Trani_Province_of_Barletta_Andria_Trani_Puglia.html")
			)
	)
	
	(assert (meta
				(nome "Centro Storico di Barletta")
				(indirizzo "Corso Vittorio Emanuele(Barletta)")
				(contatti "n.d.")
				(tipo centro_storico )
				(disabili si )
				(ospedale si )
				(animali si)
				(bus si )
				(treno si)
				(eta tutti)
				(varie movida shopping)
				(lat 41.320269)
				(lon 16.283771)	
				(descrizione "http://www.prolocobarletta.it/BARLETTA/Barletta-centro-storico.htm")
			)
	)
	
	(assert (meta
				(nome "Discoteca Lampara Club")
				(indirizzo "Lungomare Colombo(Trani)")
				(contatti " 0883 764856")
				(tipo locale )
				(disabili si )
				(ospedale si )
				(animali no)
				(bus si )
				(treno si)
				(eta giovani)
				(varie )
				(lat 41.267380)
				(lon 16.440618)
                (descrizione "http://www.lalampara.com/")				
			)
	)
	
	(assert (meta
				(nome "Discoteca Sabrage-Jubileee")
				(indirizzo "Strada provinciale 103(Corato)")
				(contatti "n.d.")
				(tipo locale )
				(disabili si )
				(ospedale si )
				(animali no)
				(bus si )
				(treno si)
				(eta giovani)
				(varie )
				(lat 41.141352)
				(lon 16.399108)
                (descrizione "https://www.facebook.com/pages/Sabrage-Jubilee-Club/294743957321933")				
			)
	)
	
	(assert (meta
				(nome "Discoteca Ipanema Club")
				(indirizzo "Litoranea Di Levante")
				(contatti "39 327 257 3675")
				(tipo locale )
				(disabili si )
				(ospedale si )
				(animali no)
				(bus si )
				(treno si)
				(eta giovani)
				(varie )
				(lat 41.319581)
				(lon 16.299509)	
				(descrizione "https://www.facebook.com/ipanemabarletta/")
			)
	)
	
	
	

	(assert (meta
				(nome "Parco Archeologico San Leucio")
				(indirizzo "Via Santa Lucia (Canosa)")
				(contatti "333 885 6300")
				(tipo parco_archeologico)
				(disabili no )
				(ospedale si )
				(animali no )
				(bus si)
				(treno no )
				(eta tutti )
				(varie eta_antica )
				(lat 41.211013)
				(lon 16.070168)
				(descrizione "\"http://www.beniculturali.it/mibac/opencms/MiBAC/sito-MiBAC/Luogo/MibacUnif/Luoghi-della-Cultura/visualizza_asset.html?id=154844&pagename=157031\" ")
			)
	)
	
	(assert (meta
				(nome "Museo archeologico palazzo Sinesi")
				(indirizzo "Via John Fitzgerald Kennedy, 20(Canosa di Puglia)")
				(contatti "333 885 6300")
				(tipo museo)
				(disabili si)
				(ospedale si )
				(animali no )
				(bus si )
				(treno no)
				(eta tutti)
				(varie eta_antica )
				(lat 41.221352)
				(lon 16.066700)
				(descrizione "\"http://www.beniculturali.it/mibac/opencms/MiBAC/sito-MiBAC/Luogo/MibacUnif/Luoghi-della-Cultura/visualizza_asset.html?id=154844&pagename=157031\" ")
			)
	)
	
	(assert (meta
				(nome "Basilica San Sepolcro")
				(indirizzo "Via Ospedali dei Pellegrini (Barletta)")
				(contatti "n.d.")
				(tipo chiesa)
				(disabili si)
				(ospedale si )
				(animali no)
				(bus si)
				(treno si )
				(eta anziani)
				(varie gotico)
				(lat 41.319032)
				(lon 16.281501)
				(descrizione "\"http://www.centrostoricobarletta.it/?dir-item=basilica-del-santo-sepolcro\" ")
			)
	)
	
	(assert (meta
				(nome "Basilica Santa Maria Dei Miracoli")
				(indirizzo "Piazza Pio X (Andria)")
				(contatti "0883 591851")
				(tipo chiesa )
				(disabili si)
				(ospedale si )
				(animali no)
				(bus si)
				(treno treno )
				(eta anziani )
				(varie romanico )
				(lat 41.232101)
				(lon 16.267480)
     			(descrizione "http://www.madonnadeimiracoli.it/")	
			)
	)
	
	(assert (meta
				(nome "Cava di Bauxite")
				(indirizzo "Strada provinciale 138 (Spinazzola)")
				(contatti "n.d.")
				(tipo parco_naturale )
				(disabili no )
				(ospedale no )
				(animali no )
				(bus no)
				(treno no)
				(eta giovani)
				(varie escursionismo )
				(lat 40.987750)
				(lon 16.182325)
				(descrizione "https://www.tripadvisor.it/Attraction_Review-g1150198-d8399959-Reviews-Cava_di_Bauxite-Spinazzola_Province_of_Barletta_Andria_Trani_Puglia.html")
			)
	)
	
		(assert (meta
				(nome "Bosco di Finizio")
				(indirizzo "Strada provinciale SP234(Andria)")
				(contatti "n.d.")
				(tipo parco_naturale )
				(disabili no )
				(ospedale no )
				(animali si)
				(bus no)
				(treno no)
				(eta tutti)
				(varie escursionismo )
				(lat 41.065829)
				(lon 16.227381)
				(descrizione "http://www.centrovisitatorredeiguardiani.com/escursione-bosco-finizio/")
			)
	)
	
			(assert (meta
				(nome "Passeggiata nella ciclovia Ruvo di Puglia-Tretturello Regio")
				(indirizzo "Stazione di Ruvo(Ruvo)")
				(contatti "n.d.")
				(tipo parco_naturale )
				(disabili no )
				(ospedale no )
				(animali no)
				(bus si)
				(treno si)
				(eta giovani)
				(varie escursionismo )
				(lat 41.113915) 
				(lon 16.478819)
				(descrizione "\"http://ciclovie.parcoaltamurgia.it/?page_id=8\" ")
			)
	)
	
	
				(assert (meta
				(nome "Passeggiata nella ciclovia L'Anello di Federico II")
				(indirizzo "Strada provinciale SP234(Andria)")
				(contatti "n.d.")
				(tipo parco_naturale )
				(disabili no )
				(ospedale no )
				(animali no)
				(bus no)
				(treno no)
				(eta giovani)
				(varie escursionismo)
				(lat 41.065829)
				(lon 16.227381)
				(descrizione "http://ciclomurgia.com/itinerari-in-bicicletta/percorsi.html")
			)
	)
	
	(assert (meta
				(nome "Passeggiata nella ciclovia Iazzo-Rosso-SanMagno-Castel del Monte")
				(indirizzo "Strada statale 170 dir a (Andria)")
				(contatti "n.d.")
				(tipo parco_naturale )
				(disabili no )
				(ospedale no )
				(animali no)
				(bus si)
				(treno no)
				(eta giovani)
				(varie escursionismo)
				(lat 41.080319)
				(lon 16.275528)
				(descrizione "\"http://www.parcoaltamurgia.gov.it/index.php?option=com_content&view=article&id=811:inaugurata-con-unescursione-la-ciclovia-qjazzo-rosso-san-magno-castel-del-monteq&catid=1:latest-news&Itemid=100018\" ")
			)
	)
	
	
		(assert (meta
				(nome "Passeggiata nella ciclovia Trinitapoli-Margherita")
				(indirizzo "SP141(Margherita di Savoia)")
				(contatti "n.d.")
				(tipo parco_naturale )
				(disabili no )
				(ospedale no )
				(animali no)
				(bus si)
				(treno no)
				(eta giovani)
				(varie escursionismo)
			    (lat 41.426361)
				(lon 16.018837)
				(descrizione "http://www.touringclub.it/evento/margherita-di-savoia-bt-passeggiata-tci-nella-riserva-naturale-delle-saline")
			)
	)
	
			(assert (meta
				(nome "Passeggiata nella ciclovia San-Francesco")
				(indirizzo "Via Roma 63(Spinazzola)")
				(contatti "n.d.")
				(tipo parco_naturale )
				(disabili no )
				(ospedale no)
				(animali no)
				(bus si)
				(treno no)
				(eta giovani)
				(varie escursionismo)
			    (lat 40.962757)
				(lon 16.091377)
				(descrizione " \"http://www.galmurgiapiu.it/?p=5791\" ")
			)
	)
	
	
				(assert (meta
				(nome "Passeggiata nella ciclovia Necropoli San Magno")
				(indirizzo "Stazione di Corato(Corato)")
				(contatti "n.d.")
				(tipo parco_naturale )
				(disabili no )
				(ospedale no)
				(animali no)
				(bus si)
				(treno no)
				(eta giovani)
				(varie escursionismo)
			    (lat 41.156839)
				(lon 16.4117558)
				(descrizione " \"http://ciclovie.parcoaltamurgia.it/?page_id=8\" ")
				
			)
	)
	
				(assert (meta
				(nome "Bosco Cecibizzo")
				(indirizzo "SP19(Corato)")
				(contatti "n.d.")
				(tipo parco_naturale )
				(disabili no )
				(ospedale no)
				(animali si)
				(bus no)
				(treno no)
				(eta giovani)
				(varie escursionismo)
			    (lat 41.059599)
				(lon 16.359056)
				(descrizione " \"http://www.parks.it/parco.nazionale.alta.murgia/iti_dettaglio.php?id_iti=3348\" ")
			)
	)
	
				(assert (meta
				(nome "Passeggiata in Lama delle Grotte")
				(indirizzo "sp 238")
				(contatti "n.d.")
				(tipo parco_naturale )
				(disabili no )
				(ospedale no)
				(animali si)
				(bus no)
				(treno no)
				(eta tutti)
				(varie escursionismo)
			    (lat 41.056864)
				(lon 16.402530)
				(descrizione "http://www.laterradipuglia.it/gli-itinerari/lama-e-le-grotte-del-vagno")
			)
	)
	
	
	(assert (meta
				(nome "Miragica")
				(indirizzo "Via dei Portuali(Molfetta)")
				(contatti "n.d.")
				(tipo parco_divertimento )
				(disabili si )
				(ospedale si )
				(animali si )
				(bus si)
				(treno no )
				(eta bambini giovani)				
				(lat 41.213324)
				(lon 16.550714)
				(descrizione "https://miragica.com/")
			)
	)
	
	(assert (meta
				(nome "Acquapark Ippocampo")
				(indirizzo "sp 141 (Manfredonia)")
				(contatti "0884 571397")
				(tipo parco_acquatico )
				(disabili si )
				(ospedale si )
				(animali si )
				(bus no)
				(treno no )
				(eta bambini giovani)				
				(lat 41.50455)
				(lon 15.911636)
				(descrizione "http://ippocampo.it/")
			)
	)
	
	(assert (meta
				(nome "SplashSea Parco Acquatico")
				(indirizzo "Via vito Siciliani (Bisceglie)")
				(contatti "328 937 3966")
				(tipo parco_acquatico)
				(disabili no )
				(ospedale si )
				(animali no )
				(bus si)
				(treno si)
				(eta bambini giovani)				
				(lat 41.249496) 
				(lon 16.491432)
				(descrizione "http://www.splashsea.it/")
			)
	)
	
	(assert (meta
				(nome " Torre Sansanello")
				(indirizzo "Contrada Sansanello (Corato)")
				(contatti " 080 898 0920")
				(tipo tenuta)
				(disabili no )
				(ospedale no )
				(animali no )
				(bus no)
				(treno no)
				(varie cultura-contadina)
				(eta tutti)				
				(lat  41.078996)  
				(lon 16.328688)
				(descrizione "https://www.tripadvisor.it/Restaurant_Review-g1028701-d5984496-Reviews-Torre_Sansanello_Restaurant-Corato_Province_of_Bari_Puglia.html")
			)
	)
	
	(assert (meta
				(nome "Museo Cantina della Sfida")
				(indirizzo "Piazza della Sfida(Barletta)")
				(contatti "0883 578111")
				(tipo museo)
				(disabili si )
				(ospedale si )
				(animali no )
				(bus si)
				(treno si)
				(varie )
				(eta tutti)				
				(lat 41.320888) 
				(lon 16.283722)
				(descrizione "https://www.tripadvisor.it/Attraction_Review-g670813-d2392594-Reviews-Cantina_della_Sfida-Barletta_Province_of_Barletta_Andria_Trani_Puglia.html")
			)
	)
	
	(assert (meta
				(nome "Azienda Agricola Rasciatano")
				(indirizzo "Via Canosa Km, 13(Barletta)")
				(contatti " 0883 510999")
				(tipo tenuta)
				(disabili si )
				(ospedale no )
				(animali si )
				(bus no)
				(treno no)
				(varie cultura-contadina )
				(eta tutti)				
				(lat 41.264606) 
				(lon 16.160524)
				(descrizione "http://www.rasciatano.com/home.html")
			)
	)
	
	(assert (meta
				(nome "Azienda Agricola Conte Spagnoletti")
				(indirizzo "C.da Zagaria S.C. 59(Andria)")
				(contatti "0883 569511 ")
				(tipo tenuta)
				(disabili si )
				(ospedale no )
				(animali si )
				(bus no)
				(treno no)
				(varie cultura-contadina)
				(eta tutti)				
				(lat 41.228340) 
				(lon 16.202203)
				(descrizione "http://www.contespagnolettizeuli.it/")
			)
	)
	
	
	(assert (meta
				(nome "Centro Storico di Minervino")
				(indirizzo "Corso Giacomo Matteotti(Barletta)")
				(contatti "n.d.")
				(tipo centro_storico )
				(disabili no)
				(ospedale no )
				(animali si)
				(bus si )
				(treno no)
				(eta tutti)
				(varie )
				(lat 41.086640)
				(lon 16.079395)	
				(descrizione "https://www.borghiautenticiditalia.it/borgo/minervino-murge")
			)
	)
	
	(assert (meta
				(nome "Centro Storico di Andria")
				(indirizzo "Piazza V. Emanuele")
				(contatti "n.d.")
				(tipo centro_storico )
				(disabili si )
				(ospedale si )
				(animali si)
				(bus si )
				(treno si)
				(eta tutti)
				(varie movida shopping)
				(lat 41.226102)
				(lon 16.296746)	
				(descrizione "\"http://www.ufficiostudi.beniculturali.it/mibac/opencms/MiBAC/sito-MiBAC/Luogo/MibacUnif/LuoghiEventi/visualizza_asset.html?id=61268&pagename=50\" ")
			)
	)
	
	(assert (meta
				(nome "Castello Svevo di Trani")
				(indirizzo "Piazza manfredi Re")
				(contatti " 0883 506603")
				(tipo castello )
				(disabili si )
				(ospedale si )
				(animali no)
				(bus si )
				(treno si)
				(eta tutti)
				(varie normanno)
				(lat 41.281673)
				(lon 16.415647)	
				(descrizione "http://www.castelloditrani.beniculturali.it/")
			)
	)
	
	(assert (meta
				(nome "Parco archeologici Canne della Battaglia")
				(indirizzo "SP 142, Barletta")
				(contatti "0883 510993")
				(tipo parco_archeologico)
				(disabili no )
				(ospedale si )
				(animali no )
				(bus si)
				(treno no )
				(eta tutti )
				(varie eta_antica )
				(lat 41.296595)
				(lon 16.151872)
				(descrizione "https://www.viaggiareinpuglia.it/at/13/areaarcheologica/3929/it/Parco-Archeologico-di-Canne-della-Battaglia")
			)
	)
	
	(assert (meta
				(nome "Museo Palazzo Jatta")
				(indirizzo "Piazza Bovio 35, Ruvo di Puglia")
				(contatti " 080 361 1042")
				(tipo museo)
				(disabili si)
				(ospedale si )
				(animali no )
				(bus si )
				(treno si)
				(eta tutti)
				(varie eta_antica )
				(lat 41.114043)
				(lon 16.486079)
				(descrizione "http://www.palazzojatta.org/il-museo-nazionale/")
			)
	)
	
	(assert (meta
				(nome "Museo del Duomo di S. Maria Maggiore")
				(indirizzo "via Mura S. Cataldo, Barletta")
				(contatti "n.d.")
				(tipo museo)
				(disabili si)
				(ospedale si )
				(animali no )
				(bus si )
				(treno si)
				(eta tutti)
				(varie eta_antica )
				(lat 41.320413)
				(lon 16.286766)
				(descrizione "http://museocattedralebarletta.sistemab.it/it/museo/")
			)
	)
	
	
	
	(assert (city (nome andria)(lat 41.2316878)(lon 16.2917300)(mezzi treno bus )))
	(assert (city (nome barletta)(lat 41.3192770)(lon 16.2839900)(mezzi treno bus)))
	(assert (city (nome canosa)(lat 41.222743)(lon 16.066741)(mezzi  bus)))
	(assert (city (nome spinazzola)(lat 40.968454)(lon 16.089516)(mezzi  bus)))
	(assert (city (nome trani)(lat 41.277485)(lon 16.417833)(mezzi treno bus)))
	(assert (city (nome molfetta)(lat 41.202777)(lon 16.598718)(mezzi treno bus)))
	(assert (city (nome margherita)(lat 41.352307)(lon 16.169856)(mezzi bus)))
	(assert (city (nome trinitapoli)(lat 41.357848)(lon 16.088905)(mezzi bus)))
	(assert (city (nome bari)(lat 41.117143)(lon 16.871871)(mezzi treno bus)))
	(assert (city (nome bisceglie)(lat 41.240532)(lon 16.501390)(mezzi treno bus)))
	(assert(struttura (nome "Hotel Salsello")(treno si)(bus si)(indirizzo "via Vito Siciliani, Bisceglie" )(tipo hotel )(lat 41.249621)(lon 16.490664 ) (stelle 4 )(wifi si)(piscina si)(spa no)(parcheggio si)(babysitter no)(animali no)(palestra no) (citta si)(cf 0.0)))
	(assert(struttura (nome "Resort Villa")(indirizzo "Viale la Testa, Bisceglie" )(treno si)(bus si)(tipo beb )(lat 41.251124)(lon 16.475106) (wifi si)(piscina si)(spa si)(parcheggio si)(animali no) (babysitter si)(palestra si)(citta si)(cf 0.0)))
	(assert(struttura (nome "Agriturismo Le Vedute")(indirizzo " sp 23, Bisceglie" )(treno no)(bus no)(tipo agriturismo )(lat 41.167588)(lon 16.485206) (wifi no)(piscina si)(spa no)(parcheggio si)(animali no) (babysitter no)(palestra no)(citta no)(cf 0.0)))
	(assert(struttura (nome "Cristal Palace")(indirizzo "via Firenze 35, Andria" )(treno si)(bus si)(tipo hotel)(lat 41.230117)(lon 16.300694) (stelle 4)(wifi si)(piscina si)(spa no)(parcheggio si)(animali no) (babysitter no)(palestra si)(citta si)(cf 0.0)))
	(assert(struttura (nome "Lama di Biomasseria")(indirizzo "localita' Montegrosso, Andria" )(treno no)(bus no)(tipo agriturismo )(lat 41.145882)(lon 16.152988) (wifi si)(piscina si)(spa no)(parcheggio si)(animali si) (babysitter no)(palestra no)(citta no)(cf 0.0)))
	(assert(struttura (nome "Palazzo ducale")(indirizzo "via Vaglio 3, Andria" )(treno si)(bus si)(tipo beb )(lat 41.225234)(lon 16.296868) (wifi si)(piscina no)(spa no)(parcheggio si)(animali no) (babysitter no)(palestra no) (citta si)(cf 0.0)))
	(assert(struttura (nome "Castel del Monte Park Hotel")(indirizzo "sp 234, Andria" )(treno no)(bus no)(tipo hotel )(lat 41.073851)(lon 16.16279067) (stelle 4)(wifi si)(piscina si)(spa no)(parcheggio si)(animali si) (babysitter si)(palestra no)(citta no)(cf 0.0)))
	(assert(struttura (nome "Itaca")(indirizzo "via Regina Elena, Barletta" )(treno si)(bus si)(tipo hotel )(lat 41.321262)(lon 16.291725) (stelle 4)(wifi si)(piscina si)(spa no)(parcheggio si)(animali si) (babysitter no)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "La Palma de sol")(indirizzo "via Ruggero Scommegna, Barletta" )(treno si)(bus si)(tipo beb )(lat 41.322472)(lon 16.16270724) (wifi si)(piscina no)(spa no)(parcheggio si)(animali si) (babysitter no)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "La boccuta")(indirizzo "vicinale boccuta, Barletta" )(tipo agriturismo )(treno no)(bus no)(lat 41.285588)(lon 16.142159) (wifi si)(piscina si)(spa no)(parcheggio si)(animali si) (babysitter no)(palestra no)(citta no)(cf 0.0)))
	(assert(struttura (nome "San Paolo al Convento")(indirizzo "via statuti Marittimi, Trani")(treno si)(bus si)(tipo hotel )(lat 41.278267)(lon 16.) (stelle 4)(wifi no)(piscina no)(spa si)(parcheggio si)(animali no) (babysitter no)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "La bella Trani")(indirizzo "lungomare cristoforo colombo, Trani")(treno si)(bus si)(tipo beb )(lat 41.381946)(lon 16.141666) (wifi si)(piscina no)(spa no)(parcheggio si)(animali si) (babysitter no)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "Tenuta Lama Gorga")(indirizzo "sp 13, Trani" )(tipo agriturismo )(treno no)(bus no)(lat 41.234501)(lon 16.446621) (wifi no)(piscina no)(spa no)(parcheggio no)(animali no) (babysitter no)(palestra no)(citta no)(cf 0.0)))
	(assert(struttura (nome "Del Sole")(indirizzo "via manfredonia, Margherita di Savoia")(treno no)(bus si)(stelle 4)(tipo hotel)(lat 41.383350)(lon 16.136947) (wifi si)(piscina no)(spa no)(parcheggio si)(animali no) (babysitter si)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "Bellavista")(indirizzo "via festiccella, Margherita di Savoia")(treno no)(bus si)(tipo beb)(lat 41.384251)(lon 16.137947)(wifi si)(piscina no)(spa no)(parcheggio si)(animali no)(babysitter no)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "Villa Ester")(indirizzo "ss 168, Palazzo San Gervasio")(treno no)(bus no)(tipo hotel)(stelle 3)(lat 40.927152)(lon 15.96894)(wifi no)(piscina no)(spa no)(parcheggio si)(animali no)(babysitter no)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "Platinum")(indirizzo "via Roma 3, Palazzo San Gervasio")(treno no)(bus si)(tipo beb)(lat 40.929770)(lon 15.982083)(wifi si)(spa no)(parcheggio si)(piscina no)(animali si)(babysitter si)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "Carrera della Regina")(indirizzo "sp 169, km 48, Banzi")(treno no)(bus no)(tipo agriturismo)(lat 40.887822)(lon 16.049888)(wifi si)(spa no)(piscina si)(parcheggio si)(animali si)(babysitter no)(palestra no)(citta no)(cf 0.0)))
	(assert(struttura (nome "Casa Pistacchio")(indirizzo "via Vittorio Veneto 5, Minervino Murge")(treno no)(bus si)(tipo beb)(lat 41.084369)(lon 16.077345)(wifi si)(spa no)(parcheggio si)(piscina si)(animali si)(babysitter si)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "Vista Murgia")(indirizzo "corso g. matteotti 50, Minervino Murge")(treno no)(bus no)(tipo beb)(lat 41.086319)(lon 16.079418)(wifi no)(spa no)(parcheggio si)(animali si)(babysitter no)(palestra no)(piscina no)(citta si)(cf 0.0)))
	(assert(struttura (nome "D'Altavilla")(indirizzo "via balilla, Canosa di Puglia ")(treno no)(bus si)(stelle 3)(tipo hotel)(lat 41.221502)(lon 16.072554) (wifi si)(piscina si)(spa no)(parcheggio si)(animali si)(babysitter no)(palestra si)(citta si)(cf 0.0)))
	(assert(struttura (nome "Posta Piana")(indirizzo "strada statale 93 km 39.500, Canosa di Puglia ")(treno no)(bus no)(tipo beb)(lat 41.211809)(lon 16.053644)(wifi si)(piscina si)(spa no)(parcheggio si)(animali si)(babysitter no)(palestra no)(citta no)(cf 0.0)))
	(assert(struttura (nome "Agriturismo La Real")(indirizzo "contrada zezza, canosa di Puglia")(treno no)(bus no)(tipo agriturismo)(lat 41.163003)(lon 15.954342)(wifi no)(spa no)(parcheggio si)(animali si)(babysitter si)(palestra no)(citta no)(cf 0.0)))
	(assert(struttura (nome "SoGlow")(indirizzo "via terlizzi, Molfetta ")(stelle 4)(treno si)(bus si)(tipo hotel)(lat 41.194777)(lon 16.592986)(wifi si)(piscina no)(spa no)(parcheggio si)(animali si)(babysitter no)(palestra si)(citta si)(cf 0.0)))
	(assert(struttura (nome "BeB Paradiso San Vincenzo")(treno si)(bus si)(tipo beb)(indirizzo "via san vincenzo, Molfetta")(lat 41.201434)(lon 16.595594)(wifi no)(piscina si)(spa no)(parcheggio si)(animali no)(babysitter si)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "Agriturismo La Ferrovia")(treno no)(bus no)(indirizzo "strada vicinale coppe, Molfetta")(tipo agriturismo)(lat 41.207336)(lon 16.576972)(wifi no)(piscina no)(spa no)(parcheggio si)(animali no)(babysitter no)(palestra no)(citta no)(cf 0.0)))
	(assert(struttura (nome "Camping La Batteria")(treno si)(bus si)(indirizzo "Panoramica Umberto Paternostro, Bisceglie")(tipo camping)(lat 41.0255326 )(lon 16.481787)(wifi no)(piscina si)(spa no)(parcheggio si)(animali si)(babysitter no)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "Camping Brezza tra gli Ulivi")(treno si)(bus si)(indirizzo "Via Imbriani 441, Bisceglie")(tipo camping)(lat 41.227006)(lon 16.535543)(wifi no)(piscina si)(spa no)(parcheggio si)(animali si)(babysitter no)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "Camping La Baia")(treno si)(bus si)(indirizzo "Lungomare Marina italiana, Giovinazzo")(tipo camping)(lat 41.191492)(lon 16.657485)(wifi no)(piscina no)(spa no)(parcheggio si)(animali si)(babysitter no)(palestra no)(citta si)(cf 0.0)))
	(assert(struttura (nome "Camping Millenium Salt Village")(treno no)(bus no)(indirizzo "Via Manfredonia, Margherita di Savoia")(tipo camping)(lat 41.383869 )(lon 16.138268)(wifi no)(piscina no)(spa no)(parcheggio si)(animali si)(babysitter no)(palestra no)(citta no)(cf 0.0)))
	(assert(struttura (nome "Camping Baia degli Angeli")(treno no)(bus no)(indirizzo "sp 141, Margherita di Savoia")(tipo camping)(lat 41.387595)(lon 16.122297 )(wifi no)(piscina si)(spa no)(parcheggio si)(animali no)(babysitter no)(palestra no)(citta no)(cf 0.0)))
	(assert(struttura (nome "Camping L'altro villaggio")(treno no)(bus si)(indirizzo "ss 170, Andria")(tipo camping)(lat 41.079981)(lon 16.274804 )(wifi no)(piscina si)(spa no)(parcheggio si)(animali si)(babysitter no)(palestra no)(citta no)(cf 0.0)))
	(assert(struttura (nome "Agriturismo Selva Reale")(treno no)(bus no)(indirizzo "sp 238, Ruvo di Puglia")(tipo agriturismo )(lat 41.052589)(lon 16.410761)(wifi no)(piscina no)(spa no)(parcheggio si)(animali si)(babysitter no)(palestra no)(citta no)(cf 0.0)))
    (assert(struttura (nome "Hotel Gazebo Rooms")(treno no)(bus si)(indirizzo "Via Risorgimento 11, Margerita di Savoia" )(tipo hotel )(lat 41.374397)(lon 16.149005 ) (stelle 3 )(wifi si)(piscina si)(spa no)(parcheggio si)(babysitter si)(animali no)(palestra no) (citta si)(cf 0.0)))
	(assert(struttura (nome "Copacabana Hotel Design")(treno no)(bus si)(indirizzo " Via Principe Amedeo 1, Margherita di Savoia" )(tipo hotel )(lat 41.374397)(lon 16.149005 ) (stelle 4 )(wifi si)(piscina si)(spa no)(parcheggio si)(babysitter si)(animali no)(palestra no) (citta si)(cf 0.0)))
	(assert(struttura (nome "Grand Hotel Terme")(treno no)(bus si)(indirizzo " Corso Garibaldi 1, Margherita di Savoia" )(tipo hotel )(lat 41.376083)(lon 16.150599 ) (stelle 4 )(wifi si)(piscina no)(spa si)(parcheggio si)(babysitter si)(animali si)(palestra si) (citta si)(cf 0.0)))
	
	)	
	
	
	
	
	
;******************************************************
;funzione per porre domande all'utente
;******************************************************
(deffunction Domanda (?testo ?spiegazione $?valori_ammessi)
		(bind ?flag_risposta FALSE)
	(while (eq ?flag_risposta FALSE) do
        (format t ?testo)
		(bind ?string "")
		(bind ?i 1)
		(while (<= ?i (length$ ?valori_ammessi))
			(bind ?string (str-cat ?string ?i "." (nth$ ?i ?valori_ammessi) " " ))
			(bind ?i (+ ?i 1))			
		)
		(if (neq ?spiegazione "") then
			(bind ?string (str-cat ?string "0.help"))		
		)
		(format t "(%s)?" ?string )
		(bind ?flag FALSE)
		(while (eq ?flag FALSE)do
			(bind ?risposta (read))
			(printout t crlf)
			(if (and(numberp ?risposta) (<= ?risposta (length$ ?valori_ammessi))) then 
					(bind ?flag TRUE) 
				else  
				(format t ?testo)
				(format t "(%s)?" ?string )
				
			)
		)
		(if (neq 0 ?risposta) then
				(bind ?return (nth$ ?risposta ?valori_ammessi))
				(bind ?flag_risposta TRUE)
			else 
				(printout t crlf  )	
				(format t ?spiegazione)
				(printout t crlf crlf )				
		)
	)
	?return	                                          
)

;Calcola la distanza in km fra due punti geografici
(deffunction distanza (?latA ?lonA ?latB ?lonB)
	(bind ?pigreco 3.1415927)
	(bind ?r 6371)
	(bind ?lat_alpha (/(* ?pigreco ?latA )180))	
	(bind ?lat_beta (/(* ?pigreco ?latB )180))	
	(bind ?lon_alpha (/(* ?pigreco ?lonA )180))	
	(bind ?lon_beta (/(* ?pigreco ?lonB )180))	
	(bind ?fi (abs (- ?lon_alpha ?lon_beta)))	
	(bind ?p (acos (+(*(sin ?lat_beta)(sin ?lat_alpha))(* (cos ?lat_beta)(cos ?lat_alpha)(cos ?fi)))))
	(bind ?d (* ?p ?r))
	?d
)	


;*************************
;template domande fatte
;************************

(deftemplate domande
	(slot nome )
	(slot testo )
	(multislot valori)
	
)


;*************************
;template attributo
;************************

(deftemplate attributo
	(slot nome )
	(slot valore )
	(slot cf
		(type FLOAT) (default 1.0))
	(slot id (default 0))
	(slot padre (default no));attributo padre
)


;********************template per meta gia' proposte
(deftemplate metaR
	(slot nome)
	(slot descrizione)
	(slot id (type INTEGER))
	(slot lat (type FLOAT))
	(slot lon (type FLOAT))

)

;****regola per minimo in un multifield********
(deffunction minimo ($?values)
	(bind ?l (length$ ?values))
	;(printout t ?l crlf)
	(bind ?min (nth$ 1 ?values))
	;(printout t ?min crlf)
	(bind ?i 2)
	
	(while (<= ?i  ?l) do
		(if (eq(min (nth$ ?i ?values) ?min) (nth$ ?i ?values))
			then (bind ?min (nth$ ?i ?values)))
		(bind ?i (+ ?i 1))
		;(printout t ?i crlf)	
	)
	?min
)
;**********************
;funzione che calcola il cf della inferenza
;***********************

(deffunction cfconclusion (?cf-global $?cfs)
	(bind ?cf (* ?cf-global (minimo $?cfs)))
	?cf	
)

;****************
;regole per domande
;****************
(defrule ask-eta
	(declare(salience 25))
	(not (attributo (nome eta)))
	=>
	(bind ?risposta (Domanda "Quanti anni hai" "Cerchero' di consigliarti le meta piu' idonee alla tua eta'" <25 25-40 40-55 >55 ))
	(assert	(attributo(nome eta)(valore ?risposta)(cf 1.0)))
	(assert (domande (nome eta)(testo "Quanti anni hai")(valori <25 25-40 40-55 >55)))
)

(defrule ask-in_zona
	(declare(salience 25))
	(not (in_zona si))
	=>
	(bind ?risposta (Domanda "Ti trovi in provincia di Barletta-Andria-Trani" "Cerchero' di consigliarti localita' vicine a te" si no))
	(assert	(in_zona ?risposta))	
)

(defrule ask-gruppo
	(declare(salience 25))
	(not (attributo (nome gruppo)))
	=>
	(bind ?risposta (Domanda "Con chi andrai in vacanza" "Sapere con chi andrai in vacanza e' importante per consigliarti le giuste meta" partner famiglia amici ))
	(assert	(attributo(nome gruppo)(valore ?risposta)(cf 1.0)))
	(assert (domande (nome gruppo)(testo "Con chi andrai in vacanza" )(valori partner famiglia amici )))
)

(defrule ask-budget
	(declare(salience 25))
	(not (attributo (nome budget)))
	=>
	(bind ?risposta (Domanda "Quanto hai intenzione di spendere all'incirca ogni giorno" "Cerchero' di consigliarti meta che non superino il tuo budget (costi viaggio esclusi)." <50 >50 ))
	(assert	(attributo(nome budget)(valore ?risposta)(cf 1.0)))
	(assert (domande (nome budget)(testo "Quanto hai intenzione di spendere all'incirca ogni giorno" )(valori <50 >50)))

)

(defrule ask-pernottamento
	(declare(salience 25))
	(not (attributo (nome pernottamento)))
	=>
	(bind ?risposta (Domanda "Preferiresti rimanere per piu' di un giorno" "E' importante saperlo perche' alcune meta neccessitano piu' giorni per essere visitate, mentre altre non dispongono di struttura alberghiere" si no  ))
	(assert	(attributo(nome pernottamento)(valore ?risposta)(cf 1.0)))
	(assert (domande (nome pernottamento)(testo "Preferiresti rimanere per piu' di un giorno" )(valori si no)))
)

(defrule ask-mezzo-pubblico
	(declare(salience 25))
	(not (attributo (nome mezzo-pubblico)))
	=>
	(bind ?risposta (Domanda "Per spostarti hai la neccessita' di utilizzare mezzi publlici " "E' importante saperlo perche' non tutte le meta sono facilmente raggiungibile con mezzi pubblici" si no))
	(assert	(attributo(nome mezzo-pubblico)(valore ?risposta)(cf 1.0)))
	(assert (domande (nome mezzo-pubblico)(testo "Hai la neccessita' di utilizzare mezzi publlici per raggiungere la localita' turistica" )(valori si no)))
)


(defrule ask-tipo-vacanza
	(declare(salience 25))
	(not (attributo (nome tipo-vacanza)))
	=>
	(bind ?risposta (Domanda "Solitamente cosa cerchi in una vacanza" "Cercero' di consigliarti localita' turistiche piu' idonee alla tua personalita'" relax divertimento cultura))
    (assert	(attributo(nome tipo-vacanza)(valore ?risposta)(cf 1.0)))
	(assert (domande (nome tipo-vacanza)(testo "Solitamente cosa cerchi in una vacanza" )(valori relax divertimento  cultura)))
)


(defrule ask-bambini
	(and (attributo (nome gruppo)(valore famiglia))
	(not(attributo (nome bambini))))
	=>
	(bind ?risposta (Domanda "Ci sono bambini con eta' al di sotto dei 5 anni in famiglia" "E' importante saperlo perche' alcune localita' non sono idonee a bambini (assenza di ospedali, pericolose, difficili da percorrere...)" si no))
	(assert	(attributo(nome bambini)(valore ?risposta) (padre gruppo)(cf 1.0)))
	(assert (domande (nome bambini)(testo "Ci sono bambini con eta' al di sotto dei 5 anni in famiglia" )(valori si no)))
)

(defrule ask-posizione
	(declare(salience 25))
	(and (in_zona si)
	(not(posizione ?v)))
	=>
	(printout t "In che citta' ti trovi? Saranno accettate solo le citta' della provincia BAT. (Cerchero' di consigliarti meta vicine a te.) " crlf)
	(assert (posizione (read)))	
	(printout t crlf)
)

(defrule ask-disabili
	(declare(salience 25))
	(not(attributo(nome disabili)))	
	=>
	(bind ?risposta (Domanda "Ci sono persone con difficolta' nel camminare" "E' importante saperlo perche' alcune localita' potrebbere non essere idonee a persone disabili" si no))
	(assert	(attributo(nome disabili)(valore ?risposta) (cf 1.0)))
	(assert (domande (nome disabili)(testo "Ci sono persone con difficolta' nel camminare" )(valori si no)))
)

(defrule ask-animali
	(and (or(attributo (nome gruppo)(valore famiglia))
		(attributo(nome gruppo)(valore partner)))
		(not (attributo (nome animali)))
		)
		=>
	(bind ?risposta (Domanda "Hai la neccesita' di portare cani o gatti" "Se devi portare con te il tuo animale domestico, non ti consiglieremo localita' a loro non idonee" si no))
	(assert	(attributo(nome animali)(valore ?risposta) (padre gruppo)(cf 1.0)))
	(assert (domande (nome animali)(testo "Hai la neccesita' di portare cani o gatti")(valori si no)))
)

(defrule ask-tipo-mezzo
	(and (attributo (nome mezzo-pubblico)(valore si))
		(not (attributo(nome tipo-mezzo))))
	=>
	(bind ?risposta (Domanda "Quale mezzo pubblico preferiresti utilizzare" "Alcune localita' non sono raggiungibili con qualsiasi mezzo pubblico; Cercero' di consigliarti quelle piu' adatte per te." treno bus indifferente))
	(assert	(attributo(nome tipo-mezzo)(valore ?risposta) (padre mezzo-pubblico)(cf 1.0)))
	(assert (domande (nome tipo-mezzo)(testo "Quale mezzo pubblico preferiresti utilizzare")(valori treno bus indifferente )))
)


(defrule ask-sport-acqua

	(attributo (nome sport-spiaggia)(valore no))
	(not (attributo (nome sport-acqua)))
	=>
	(bind ?risposta (Domanda "Ti piace praticare immersioni subacque" "Alcune zone sono piu adatte a praticare immersioni." si no ))
	(assert	(attributo(nome sport-acqua)(valore ?risposta) (padre sport-spiaggia)(cf 1.0)))
	(assert (domande (nome sport-acqua)(testo "Ti piace praticare immersioni subacque" )(valori si no )))	
)
(defrule ask-sport-spiaggia2
	(attributo(nome mare)(valore si))
	(attributo (nome gruppo)(valore famiglia))
	(attributo (nome bambini)(valore no))
	(not(attributo(nome sport-spiaggia)))
	=>
	(bind ?risposta (Domanda "Ti piace giocare sulla spiaggia(beachvolley, calcio, racchettoni..)" "Alcune spiagge sono piu' idoneo per giocare." si no ))
	(assert	(attributo(nome sport-spiaggia)(valore ?risposta) (padre mare)(cf 1.0)))
	(assert	(attributo(nome sport-spiaggia)(valore ?risposta) (padre gruppo)(cf 1.0)))
	(assert	(attributo(nome sport-spiaggia)(valore ?risposta) (padre bambini)(cf 1.0)))		
	(assert (domande (nome tipo-spiaggia)(testo  "Ti piace giocare sulla spiaggia(beachvolley, calcio, racchettoni..)" )(valori si no)))

)

(defrule ask-sport-spiaggia
	(attributo(nome mare)(valore si))
	(not(attributo (nome gruppo)(valore famiglia)))
	(and(attributo (nome disabili)(valore no))(not(attributo (nome eta)(valore >55))))
	(not(attributo(nome sport-spiaggia)))
	
	=>
	(bind ?risposta (Domanda "Ti piace giocare sulla spiaggia(beachvolley, calcio, racchettoni..)" "Alcune spiagge sono piu' idoneo per giocare." si no ))
	(assert	(attributo(nome sport-spiaggia)(valore ?risposta) (padre mare)(cf 1.0)))
	(assert	(attributo(nome sport-spiaggia)(valore ?risposta) (padre gruppo)(cf 1.0)))
	(assert	(attributo(nome sport-spiaggia)(valore ?risposta) (padre disabili)(cf 1.0)))
	(assert	(attributo(nome sport-spiaggia)(valore ?risposta) (padre eta)(cf 1.0)))
	(assert (domande (nome tipo-spiaggia)(testo  "Ti piace giocare sulla spiaggia(beachvolley, calcio, racchettoni..)" )(valori si no)))
)


(defrule ask-mare
	(attributo(nome tipo-vacanza)(valore relax))
	(mese ?m&:(and(> ?m 5)(< ?m 10)))
	(not(attributo(nome mare)))
	=>
	(bind ?risposta (Domanda "Dato che e' estate, ti piacerebbe rilassarti in localita' balneari" "Cerchero' di consigliarti localita' piu' idonee alle tue preferenze" si no ))
	(if (eq ?risposta si) then
		(assert	(attributo(nome mare)(valore si) (padre tipo-vacanza)(cf 1.0)))        		
		else
		(assert	(attributo(nome mare)(valore no) (padre tipo-vacanza)(cf 1.0)))		
	)
	(assert (domande (nome mare)(testo  "Dato che e' estate, ti piacerebbe rilassarti in localita' balneari" )(valori si no)))
)



(defrule ask-shopping4
	(and (attributo(nome gruppo)(valore famiglia)) (attributo(nome bambini)(valore si)) (attributo (nome mare)(valore no)) )
	(not (attributo (nome shopping)))
	=>
	(bind ?risposta (Domanda "Vorresti fare shopping " "Fare shopping potrebbe essere un buon modo per rilassarsi" si no ))
	(assert	(attributo(nome shopping)(valore ?risposta) (padre gruppo)(cf 1.0)))
	(assert	(attributo(nome shopping)(valore ?risposta) (padre bambini)(cf 1.0)))
	(assert (domande (nome shopping)(testo "Vorresti fare shopping " )(valori si no )))	
)

(defrule ask-shopping
	(attributo (nome naturali)(valore no)) 
	(not (attributo (nome shopping)))
	=>
	(bind ?risposta (Domanda "Vorresti fare shopping " "Fare shopping potrebbe essere un buon modo per rilassarsi" si no ))
	(assert	(attributo(nome shopping)(valore ?risposta) (padre naturali)(cf 1.0)))
	(assert (domande (nome shopping)(testo "Vorresti fare shopping " )(valori si no )))	
)

(defrule ask-shopping2	
	(and (attributo (nome mare)(valore no)) (attributo(nome eta)(valore >55)))
	(not(attributo (nome shopping)))
	=>
	(bind ?risposta (Domanda "Vorresti fare shopping " "Fare shopping potrebbe essere un buon modo per rilassarsi" si no ))
	(assert	(attributo(nome shopping)(valore ?risposta) (padre mare)(cf 1.0)))
	(assert	(attributo(nome shopping)(valore ?risposta) (padre eta)(cf 1.0)))
	(assert (domande (nome shopping)(testo "Vorresti fare shopping " )(valori si no )))	
)

(defrule ask-shopping3	
	(and (attributo (nome mare)(valore no)) (attributo(nome disabili)(valore si)))
	(not(attributo (nome shopping)))
	=>
	(bind ?risposta (Domanda "Vorresti fare shopping " "Fare shopping potrebbe essere un buon modo per rilassarsi" si no ))
	(assert	(attributo(nome shopping)(valore ?risposta) (padre mare)(cf 1.0)))
	(assert	(attributo(nome shopping)(valore ?risposta) (padre disabili)(cf 1.0)))
	(assert (domande (nome shopping)(testo "Vorresti fare shopping " )(valori si no )))	
)

(defrule ask-naturali2
	(attributo(nome mare)(valore no))
	(attributo (nome gruppo)(valore famiglia))
	(attributo (nome bambini)(valore no))
	(not(attributo(nome naturali)))
	=>
	(bind ?risposta (Domanda "Ti piacerebbe visitare luoghi a contatto con la natura)" "Cerchero' di consigliarti mete a contatto con la natura." si no ))
	(assert	(attributo(nome naturali)(valore ?risposta) (padre mare)(cf 1.0)))
	(assert	(attributo(nome naturali)(valore ?risposta) (padre gruppo)(cf 1.0)))
	(assert	(attributo(nome naturali)(valore ?risposta) (padre bambini)(cf 1.0)))		
	(assert (domande (nome naturali)(testo  "Ti piacerebbe visitare luoghi a contatto con la natura" )(valori si no)))
)

(defrule ask-naturali
	(attributo(nome mare)(valore no))
	(not(attributo (nome gruppo)(valore famiglia)))
	(and (attributo (nome eta)(valore ~>55))(attributo (nome disabili)(valore no)))
	(not(attributo(nome naturali)))	
	=>
	(bind ?risposta (Domanda "Ti piacerebbe visitare luoghi a contatto con la natura" "Cerchero' di consigliarti mete a contatto con la natura." si no ))
	(assert	(attributo(nome naturali)(valore ?risposta) (padre mare)(cf 1.0)))
	(assert	(attributo(nome naturali)(valore ?risposta) (padre gruppo)(cf 1.0)))
	(assert	(attributo(nome naturali)(valore ?risposta) (padre eta)(cf 1.0)))
	(assert	(attributo(nome naturali)(valore ?risposta) (padre disabili)(cf 1.0)))
	(assert (domande (nome naturali)(testo  "Ti piacerebbe visitare luoghi a contatto con la natura" )(valori si no)))
)



(defrule ask-lidi
	(attributo (nome mare)(valore si))
	(and(attributo(nome disabili)(valore no)) (not(attributo (nome eta)(valore >55))) (attributo (nome bambini)(valore no)))
	(not(attributo(nome lidi)))		
	=>
	(bind ?risposta (Domanda "Preferisci spiagge libere o stabilimenti balneari" "Cerchero' di consigliarti spiagge' piu' idonee alle tue preferenze" spiagge_libere stabilimenti_balneari ))
	(assert	(attributo(nome lidi)(valore ?risposta) (padre mare)(cf 1.0)))	
	(assert (domande (nome lidi)(testo  "Preferisci spiagge libere o stabilimenti balneari"  )(valori spiagge_libere stabilimenti_balneari)))
)

(defrule ask-animazione-anziani	
	(or(attributo(nome eta)(valore 40-55))
	(attributo(nome eta)(valore >55)))
	(attributo(nome tipo-vacanza)(valore divertimento))
	(not (attributo(nome animazione-anziani)))
	=>
	(bind ?risposta (Domanda "Vorresti andare in locali che prevedono spettacoli, cabaret, ballo..." "" si no ))
	(assert	(attributo(nome animazione-anziani)(valore ?risposta) (padre eta)(cf 1.0)))
	(assert	(attributo(nome animazione-anziani)(valore ?risposta) (padre tipo-vacanza)(cf 1.0)))
	(assert (domande (nome animazione-anziani)(testo  "Vorresti andare in locali che prevedono spettacoli, cabaret, ballo...")(valori si no)))
)

(defrule ask-parchi-divertimento
	(attributo(nome tipo-vacanza)(valore divertimento))
	(not (attributo (nome eta)(valore >55)))	
	(not (attributo(nome parchi-divertimento)))
	=>
	(bind ?risposta (Domanda "Vorresti andare in parchi di divertimento" "Parchi di divertimento(parchi a tema, o parchi acquatici) sono un buon modo per divertirsi stando in compagnia" si no ))
	(assert	(attributo(nome parchi-divertimento)(valore ?risposta) (padre tipo-vacanza)(cf 1.0)))
	(assert	(attributo(nome parchi-divertimento)(valore ?risposta) (padre eta)(cf 1.0)))	
	(assert (domande (nome parchi-divertimento)(testo  "Vorresti andare in parchi di divertimento" )(valori si no)))
)


(defrule ask-camper
	(attributo(nome mezzo-pubblico)(valore no))
	(not(attributo (nome camper)))
	=>
	(bind ?risposta (Domanda "Stai viaggiando con un camper/roulotte" "Cerchero' di consigliarti strutture idonee per i camper" si no ))
	(assert (domande (nome camper)(testo  "Stai viaggiando con un camper/roulotte"  )(valori si no)))
	(assert(attributo (nome camper)(valore ?risposta)(padre mezzo-pubblico)))
)


(defrule ask-cultura-contadina
	(attributo(nome tipo-vacanza)(valore cultura))
	(not(attributo (nome cultura-contadina)))
	=>
	(bind ?risposta (Domanda "Saresti interessato alla cultura contadina" "Cerchero' di consigliarti localita' particolari della civilta' contadina." si no ))
	(assert (domande (nome cultura-contadina)(testo  "Saresti interessato alla cultura contadina"  )(valori si no)))
	(assert(attributo (nome cultura-contadina)(valore ?risposta)(padre tipo-vacanza)))
)

(defrule ask-stile-cultura
	(and (attributo (nome cultura-contadina)(valore no))
	(not(attributo(nome stile-arte))))
	=>
	(bind ?risposta (Domanda "A quale periodo storico/artistico sei maggiormente interessato" "Cerchero' di consigliarti localita' storiche a cui sei piu' interessato. Se per te non ha importanza rispodi 'indifferente'" romanico  normanno eta_antica indifferente ));castelli parchi archeologici
	(assert	(attributo(nome stile-arte)(valore ?risposta) (padre cultura)(cf 1.0)))
	(assert (domande (nome stile-arte)(testo  "A quale periodo storico/artistico sei maggiormente interessato" )(valori romanico normanno eta_antica indifferente )))
)


;*****************************************************************
;regola per combinare due meta con lo stesso nome
;*******************************************************************

(deffunction combina-cf-meta (?cf1 ?cf2)
	(if (and(>= ?cf1 0)(>= ?cf2 0))then
		(bind ?ncf (-(+ ?cf1 ?cf2)(* ?cf1 ?cf2)))
	)
	(if (and(< ?cf1 0)(< ?cf2 0))then
		(bind ?ncf (+(+ ?cf1 ?cf2)(* ?cf1 ?cf2)))
	)
	(if (or (and (< ?cf1 0)(> ?cf2 0))(and (> ?cf1 0)(< ?cf2 0))(eq ?cf1 0.0)(eq ?cf2 0.0)) then		
		(bind ?ncf (/(+ ?cf1 ?cf2)(- 1 (min (abs ?cf1) (abs ?cf2)))))
	)
	?ncf
)

;combina se trova il valore nello slot
(deffunction combina-meta (?cf2 ?tipo ?slot ?valore)
	(if (deftemplate-slot-multip ?tipo ?slot) then
		(delayed-do-for-all-facts((?m ?tipo))(member$ ?valore ?m:?slot) (modify ?m (cf (combina-cf-meta ?m:cf ?cf2))))
		else 
		(delayed-do-for-all-facts((?m ?tipo))(eq ?m:?slot ?valore) (modify ?m (cf (combina-cf-meta ?m:cf ?cf2))))	
	)
)
;combina se non trova il valore nello slot
(deffunction combina-meta2 (?cf2 ?slot ?valore)
	(delayed-do-for-all-facts((?m meta))(not(member$ ?valore ?m:?slot)) (modify ?m (cf (combina-cf-meta ?m:cf ?cf2))))
)



	

;regole inferenza meta
;***************************************************
(defrule meta-vicine
	(declare(salience 20))
	
	(posizione ?p)
	(city (nome ?p)(lat ?lat)(lon ?lon))
	=>
	(delayed-do-for-all-facts ((?m meta)) (> (distanza ?lat ?lon ?m:lat ?m:lon) 20) (modify ?m (cf -1.0)))	
)

(defrule meta-tipo-relax-inverno
	(declare(salience 20))
	(attributo(nome tipo-vacanza)(valore relax))
	(not(mese ?m&:(and(> ?m 5)(< ?m 10))))
	(not(attributo(nome gruppo)(valore partner)))	
	=>
	(assert (attributo (nome mare)(valore no)  (padre tipo-vacanza)(cf 0.7)))
	(assert (attributo (nome mare)(valore no)  (padre gruppo)(cf 0.7)))	
)

(defrule meta-mezzo-pubblico
	(declare(salience 20))
	(attributo(nome tipo-mezzo)(valore indifferente))
	(attributo(nome mezzo-pubblico)(valore si))	
	=>
	(delayed-do-for-all-facts((?m meta)) (and (eq ?m:treno no) (eq ?m:bus no)) (modify ?m (cf (combina-cf-meta ?m:cf -1.0))))
	(delayed-do-for-all-facts((?s struttura)) (and (eq ?s:treno no) (eq ?s:bus no)) (modify ?s (cf (combina-cf-meta ?s:cf -1.0))))
)

(defrule meta-mezzo-treno
	(declare(salience 20))
	(attributo(nome tipo-mezzo)(valore treno))	
	=>
	(combina-meta -1.0 meta treno no)
	(combina-meta -1.0 struttura treno no)	
)

(defrule meta-mezzo-bus
	(declare(salience 20))
	(attributo(nome tipo-mezzo)(valore bus))	
	=>
	(combina-meta -1.0 meta bus no)
	(combina-meta -1.0 struttura bus no)	
)

(defrule meta-camping
	(declare(salience 20))
	(attributo(nome camper)(valore si))	
	=>
	(combina-meta 0.4 struttura tipo camping)	
)

(defrule meta-budget-minore
	(declare(salience 20))
	(attributo(nome budget)(valore <50))	
	=>	
	(combina-meta -1.0 struttura stelle 4)
	(combina-meta -1.0 struttura stelle 5)
)

(defrule meta-budget-maggiore
	(declare(salience 20))
	(attributo(nome budget)(valore >50))	
	=>	
	(combina-meta 0.10 struttura stelle 4)
	(combina-meta 0.10 struttura stelle 5)
)

(defrule meta-auto
	(declare(salience 20))
	(attributo(nome mezzo-pubblico)(valore no))	
	=>
	(combina-meta 0.1 struttura parcheggio si)	
)


(defrule meta-movida
	(declare(salience 20))
	(attributo(nome gruppo)(valore amici))	
	(attributo(nome tipo-vacanza)(valore divertimento))
	(or (attributo(nome eta)(valore <25)) (attributo(nome eta)(valore 25-40)))
	(not (blocca meta-movida))
	=>	
	(combina-meta 0.2 meta eta giovani)
	(combina-meta 0.2 meta varie movida)
	(combina-meta 0.2 meta tipo locale)
	(assert(blocca meta-movida))
)

(defrule meta-neonati
	(declare(salience 20))
	(attributo(nome bambini)(valore si))	
	
	=>	
	(combina-meta -1.0 meta disabili no)
	(combina-meta 0.2 struttura babysitter si)
)

(defrule meta-spiaggiaLibera
	(declare(salience 20))
	(attributo (nome lidi)(valore spiagge_libere))
	=>
	(combina-meta 0.2 meta varie spiagge_libere)
)

(defrule meta-spiaggiaAPagamento
	(declare(salience 20))
	(attributo (nome lidi)(valore stabilimenti_balneari))
	=>
	(combina-meta 0.2 meta varie lido_attrezzato)
)

(defrule meta-sport-spiaggia
	(declare(salience 20))
	(attributo (nome sport-spiaggia)(valore si))
	(not (blocca sport-spiaggia))
	=>
	(combina-meta 0.2 meta varie sabbia)
	(combina-meta 0.1 struttura palestra si)
	(assert (blocca sport-spiaggia))
)

(defrule meta-sport-acqua
	(declare(salience 20))
	(attributo (nome sport-acqua)(valore si))
	=>
	(combina-meta 0.2 meta varie roccia)
	(combina-meta 0.1 struttura palestra si)
)

(defrule meta-mare
	(declare(salience 20))
     (not (blocca meta-mare))	
	(attributo (nome sport-spiaggia)(valore no))
	(attributo (nome sport-acqua)(valore no))
	=>
	(combina-meta 0.20 meta tipo spiaggia)
    (assert(blocca meta-mare))
)

(defrule meta-tipoSpiaggia
	(declare(salience 20))
	(or(attributo(nome disabili)(valore si))(attributo (nome eta)(valore >55)) (attributo (nome bambini)(valore si)))	
	(attributo(nome mare)(valore si))
	(not (attributo (nome tipo-spiaggia)))
	(not (attributo (nome lidi)))
	(not (blocca meta-tipoSpiaggia))
	=>	
	(combina-meta 0.2 meta varie sabbia)
	(combina-meta 0.2 meta varie stabilimenti_balneari)
	(assert (blocca meta-tipoSpiaggia))
)


(defrule struttura-agriturismi
	(declare(salience 20))
	(or(attributo(nome gruppo)(valore famiglia))(attributo (nome gruppo)(valore partner)))
    (attributo (nome budget)(valore <50))	
	=>		
	(combina-meta 0.2 struttura tipo agriturismo)
)

(defrule meta-disabili
	(declare(salience 20))
	(attributo(nome disabili)(valore si))	
	=>	
	(combina-meta -1.0 meta disabili no)		
)

(defrule meta-animali
	(declare(salience 20))
	(attributo(nome animali)(valore si))	
	
	=>	
	(combina-meta -1.0 meta animali no)
	(combina-meta -1.0 struttura animali no)		
)

(defrule meta-animazione-anziani
	(declare(salience 20))
	(attributo(nome animazione-anziani)(valore si))	
	(not (blocca meta-animazione-anziani))
	=>	
	(combina-meta 0.2 meta varie animazione-anziani)
	(assert (blocca meta-animazione-anziani))
		
)

(defrule meta-inverno
	(declare(salience 20))
	(mese ?m&:(or(< ?m 6)(> ?m 9)))	
	=>	
	(combina-meta -1.0 meta tipo spiaggia)
	(combina-meta -1.0 meta tipo parco_acquatico)	
)

(defrule meta-relax-naturali
	(declare(salience 20))
	(attributo (nome naturali)(valore si))
	(not(blocca meta-relax-naturali))	
	=>
	(combina-meta 0.3 meta tipo parco_naturale)
	(assert (blocca meta-relax-naturali))
)


(defrule meta-relax-shopping
	(declare(salience 20))
	(attributo (nome shopping)(valore si))
	(not(blocca meta-relax-shopping))
	=>
	(combina-meta 0.2 meta varie shopping)
	(assert(blocca meta-relax-shopping))
)


(defrule meta-parchi-divertimento-no
	(declare(salience 20))
	(attributo(nome parchi-divertimento)(valore no))
	(not(blocca meta-parchi-divertimento-no))
	
	=>	
	(combina-meta -1.0 meta tipo parco_acquatico)
	(combina-meta -1.0 meta tipo parco_divertimento)
	(assert (blocca meta-parchi-divertimento-no))
)

(defrule meta-parchi-estivi
	(declare(salience 20))
	(attributo(nome parchi-divertimento)(valore si))
	(not(blocca meta-parchi-estivi))
	(mese ?m&:(and(< ?m 10)(> ?m 5)))
	=>	
	(combina-meta 0.3 meta tipo parco_acquatico)
	(combina-meta 0.3 meta tipo parco_divertimento)
	(assert(blocca meta-parchi-estivi))
)

(defrule meta-parchi-inverno
	(declare(salience 20))
	(attributo(nome parchi-divertimento)(valore si))
	(mese ?m&:(or(< ?m 6)(> ?m 9)))
	(not (blocca meta-parchi-inverno))
	=>	
	(combina-meta 0.3 meta tipo parco_divertimento)
	(assert(blocca meta-parchi-inverno))
)

(defrule meta-cultura-contadina
	(declare(salience 20))
	(attributo(nome cultura-contadina)(valore si))
	=>	
	(combina-meta 0.3 meta varie cultura-contadina)
	(combina-meta 0.2 struttura tipo agriturismo)
)

(defrule meta-stile-cultura
	(declare(salience 20))
	(attributo(nome stile-arte)(valore ?v))
	=>	
	(combina-meta 0.3 meta varie ?v)
	(combina-meta 0.15 meta tipo castello)
	(combina-meta 0.15 meta tipo museo)
	(combina-meta 0.15 meta tipo chiesa)
	(combina-meta 0.15 meta tipo parco_archeologico)
)

(defrule meta-cultura
	(declare(salience 20))
	(attributo(nome stile-arte)(valore indifferente))
	=>	
	(combina-meta 0.28 meta tipo castello)
	(combina-meta 0.3 meta tipo museo)
	(combina-meta 0.28 meta tipo chiesa)
	(combina-meta 0.3 meta tipo parco_archeologico)
)

(defrule meta-partner
	(declare(salience 20))
	(attributo(nome gruppo)(valore partner))
	(attributo (nome tipo-vacanza)(valore relax))
	(not(blocca meta-partner))
	=>	
	(combina-meta 0.1 meta tipo centro_benessere)
	(combina-meta 0.1 struttura spa si)
	
	(assert (blocca meta-partner))
)

(defrule strutturametaVicine
	(declare(salience 20))
	(metaR (lat ?lat)(lon ?lon))	
	=>
	(delayed-do-for-all-facts ((?b blocca)) ?b (retract ?b))
	(delayed-do-for-all-facts ((?s struttura)) (> (distanza ?lat ?lon ?s:lat ?s:lon) 15) (modify ?s (cf -1.0)))
	(delayed-do-for-all-facts ((?m meta)) (> (distanza ?lat ?lon ?m:lat ?m:lon) 17) (modify ?m (cf -1.0)))
	(delayed-do-for-all-facts ((?a attributo)) ?a  (modify ?a (id 0)))
	(refresh meta-inverno)
	(refresh meta-parchi-estivi)
	(refresh meta-parchi-inverno)
	(refresh meta-relax-naturali)
			
)
	


;;*****************************
;;* PRINT meta RULES *
;;*****************************
  
(deffunction mostra-meta (?nome ?tipo ?indirizzo ?contatti ?distanza)
	(printout t crlf "IL MIO CONSIGLIO PER TE E':" crlf)
	(printout t "******************************************" crlf )
	(printout t ?nome " (" ?tipo ")" crlf)
	(printout t "INDIRIZZO: " ?indirizzo  crlf)
	(printout t "CONTATTI:" ?contatti  crlf crlf)
	(if (neq ?distanza 0) then (printout t "Distanza dal punto in cui ti trovi: " (round ?distanza) " km (circa)"  crlf))
	(printout t  "******************************************" crlf crlf)  
)

(defrule stampa-meta
	(declare (salience 8))	
	(posizione ?p)
	(city (nome ?p)(lat ?clat)(lon ?clon))
    ?m<-(meta(nome ?n)(indirizzo ?i)(contatti ?c)(tipo ?t)(descrizione ?d)(cf ?cf&:(> ?cf 0.4)) (lat ?lat)(lon ?lon))
	(not (meta (nome ?n2) (cf ?cf2&:(> ?cf2 ?cf))))    
	(not (metaR (nome ?nome)))
   =>
   (bind ?dist(distanza ?clat ?clon ?lat ?lon)) 
   (bind ?*metaId* (+ ?*metaId* 1))
   (mostra-meta ?n ?t ?i ?c  ?dist )		
   (assert (metaR (nome ?n)(descrizione ?d)(id ?*metaId* )(lat ?lat)(lon ?lon)))
   (delayed-do-for-all-facts ((?me meta)) (< ?me:cf 10) (modify ?me (cf 0.0)))  
   (delayed-do-for-all-facts ((?s struttura)) (< ?s:cf 10) (modify ?s (cf 0.0))) 
)

(defrule stampa-meta-no-posizione
	(declare (salience 8))	
    ?m<-(meta(nome ?n)(indirizzo ?i)(contatti ?c)(tipo ?t)(descrizione ?d)(cf ?cf&:(> ?cf 0.4)) (lat ?lat)(lon ?lon))
	(not (meta (nome ?n2) (cf ?cf2&:(> ?cf2 ?cf))))    
	(not (metaR (nome ?nome)))
   =>    
   (bind ?*metaId* (+ ?*metaId* 1))
   (mostra-meta ?n ?t ?i ?c 0 )		
   (assert (metaR (nome ?n)(descrizione ?d)(id ?*metaId* )(lat ?lat)(lon ?lon)))
   (delayed-do-for-all-facts ((?me meta)) (< ?me:cf 10) (modify ?me (cf 0.0)))  
   (delayed-do-for-all-facts ((?s struttura)) (< ?s:cf 10) (modify ?s (cf 0.0)))  
)

(defrule stampa-meta2
	(declare (salience -1000))
	
	(posizione ?p)
	(city (nome ?p)(lat ?clat)(lon ?clon))
    ?m<-(meta(nome ?n)(indirizzo ?i)(contatti ?c)(tipo ?t)(descrizione ?d)(cf ?cf&:(or (> ?cf 0.0)(eq ?cf 0.0))) (lat ?lat)(lon ?lon))
	(not (meta (nome ?n2) (cf ?cf2&:(> ?cf2 ?cf))))    
	(not (metaR (nome ?nome)))
   =>
   (bind ?dist(distanza ?clat ?clon ?lat ?lon)) 
   (bind ?*metaId* (+ ?*metaId* 1))
   (mostra-meta ?n ?t ?i ?c  ?dist )		
   (assert (metaR (nome ?n)(descrizione ?d)(id ?*metaId* )(lat ?lat)(lon ?lon)))
    (delayed-do-for-all-facts ((?me meta)) (< ?me:cf 10) (modify ?me (cf 0.0)))  
   (delayed-do-for-all-facts ((?s struttura)) (< ?s:cf 10) (modify ?s (cf 0.0))) 
)

(defrule stampa-meta-no-posizione2
	(declare (salience -1000))	
    ?m<-(meta(nome ?n)(indirizzo ?i)(contatti ?c)(tipo ?t)(descrizione ?d)(cf ?cf&:(or (> ?cf 0.0)(eq ?cf 0.0))) (lat ?lat)(lon ?lon))
	(not (meta (nome ?n2) (cf ?cf2&:(> ?cf2 ?cf))))    
	(not (metaR (nome ?nome)))
   =>    
   (bind ?*metaId* (+ ?*metaId* 1))
   (mostra-meta ?n ?t ?i ?c 0 )		
   (assert (metaR (nome ?n)(descrizione ?d)(id ?*metaId* )(lat ?lat)(lon ?lon)))
   (delayed-do-for-all-facts ((?me meta)) (< ?me:cf 10) (modify ?me (cf 0.0)))  
   (delayed-do-for-all-facts ((?s struttura)) (< ?s:cf 10) (modify ?s (cf 0.0))) 
)

(defrule stampa-meta-vicine
	(declare (salience 8))	
	(or(and(alloggio ok)(attributo(nome pernottamento)(valore si))) (attributo(nome pernottamento)(valore no)))
	(metaR (nome ?n))	
	(domandaModifica si)
     =>
    (bind ?risposta (Domanda "Vuoi conoscere altre meta vicine a quella proposta" "" si no))
	(bind ?flag FALSE)
    (if (eq ?risposta si) then
		(delayed-do-for-all-facts ((?m meta)) (and (neq ?m:nome ?n)(>= ?m:cf 0.18)) (printout t "- "?m:nome " indirizzo:" ?m:indirizzo " contatti:" ?m:contatti crlf crlf) (bind ?flag TRUE))
		(if (eq ?flag FALSE) then
			(delayed-do-for-all-facts ((?m meta)) (and (neq ?m:nome ?n)(> ?m:cf 0.0)) (printout t "- "?m:nome crlf crlf))
		)
	)	
	(halt)
	;(reset)
)  

 
(defrule stampa-struttura
	(declare (salience 8))	
	
	(domandaModifica si)	
	?s<-(struttura (nome ?n)(indirizzo ?i)(tipo ?t)(wifi ?w)(piscina ?p)(babysitter ?b)(spa ?spa)(palestra ?pal)(parcheggio ?par)(animali ?animal)(cf ?cf&:(>= ?cf 0.0)))
	(not (struttura (nome ?s2) (cf ?cf2&:(> ?cf2 ?cf))))    
	;(not (struttura ((nome ?n2)) (cf ?cf2&:(> ?cf2 ?cf)))) 
	(not (alloggio ok))
	=>	
	(if (any-factp ((?f attributo)) (and (eq ?f:nome pernottamento) (eq ?f:valore si))) then
		(bind ?risposta (Domanda "Vuoi che ti suggerisca dove poter alloggiare" "" si no))
		(if (eq ?risposta si) then
			(printout t crlf "TI SUGGERISCO DI ALLOGGIARE PRESSO:" crlf)
			(printout t "*****************************")
			(printout t crlf ?n ", " ?i crlf crlf)
			(printout t "tipologia: " ?t crlf crlf)
			(printout t "Servizi: " crlf)
			(printout t "wifi: " ?w crlf)
			(printout t "piscina: " ?p crlf)
			(printout t "babysitter: " ?b crlf)
			(printout t "spa: " ?spa crlf)
			(printout t "palestra: " ?pal crlf)
			(printout t "parcheggio: " ?par crlf)
			(printout t "animali: " ?animal crlf)
			(printout t "*****************************" crlf crlf)
		)
	)
	(assert (alloggio ok))

)

(defrule retractMetaFinale-facts
	(declare (salience -150))
	?f<-(metaFinale stampata)
	=>
	(retract ?f)

)

(defrule mostra-descrizione
	(declare (salience 5))
	(not (descrizione ok))
	(metaR (nome ?n)(descrizione ?d)(id ?id))
	=>
	(bind ?risposta (Domanda "Vuoi cercare altre informazioni su web" "" si no))
	(if (eq ?risposta si)then
		(open_link ?d)	
		(printout t crlf)
	)	
	(assert (descrizione ok))	
)

(defrule retract_id_desc
	(declare (salience 5))
	?v<-(id-desc ?id&:(neq ?id 0))
	(descrizione ok)
	=>
	(retract ?v)
)

(deftemplate id-attributo
	(slot id)
	(slot attributo)
)


(defrule prendi-attributi
	(declare (salience 5))
	(descrizione ok)
	?m<-(mese ?mese)	
	=>
	(bind ?rispostaId 0)
	(printout t "Ti abbiamo mostrato queste meta perche' hai espresso le seguenti preferenze" crlf crlf)
	(do-for-all-facts ((?a attributo))
		(and(eq ?a:cf 1.0  )(not(any-factp ((?a2 attributo)) (and (eq ?a2:nome ?a:nome) (any-factp (( ?idat id-attributo)) (eq ?idat:attributo ?a2:nome) ))))) 
		(bind ?*attributoId* (+ ?*attributoId* 1)) (assert (id-attributo (attributo ?a:nome) (id ?*attributoId*)))(printout t ?*attributoId* ") "?a:nome " : " ?a:valore crlf)
	)
	(printout t crlf)
	(bind ?risposta (Domanda "Vuoi modificare alcune preferenze" "" si no))
	(if (eq ?risposta si)
		then
		(bind ?flag FALSE)
		(while (eq ?flag FALSE) do 
			(printout t "Inserisci il numero corrispondente alla preferenza da modificare" crlf)
			(bind ?rispostaId (read))
			(if (and(numberp ?rispostaId)(<= ?rispostaId ?*attributoId*)) then (bind ?flag TRUE))
			(assert (id-attr ?rispostaId))
			(delayed-do-for-all-facts ((?m meta)) (< ?m:cf 1)(modify ?m (cf 0.0) ))
			(delayed-do-for-all-facts ((?s struttura)) (< ?s:cf 10)(modify ?s (cf 0.0)))
			;(refresh meta-mese) non esiste piu questa regola
			(refresh meta-inverno)
			(refresh meta-parchi-estivi)
			(refresh meta-parchi-inverno)
			(refresh meta-relax-naturali)					
			(refresh meta-vicine)
		)
	)	
	(assert (domandaModifica si))
)
 

(deffunction retract-attributi-senza-padre ()
	(bind ?flag TRUE)
	(while (eq ?flag TRUE)do
		(bind ?flag FALSE)		
		(do-for-all-facts ((?a attributo))
			(and(not(any-factp((?a1 attributo))(eq ?a1:nome ?a:padre))) (neq ?a:padre no)) 
			(delayed-do-for-all-facts ((?a2 attributo)) (eq ?a2:nome ?a:nome)(retract ?a2)) (retract ?a)(bind ?flag TRUE)
		)
	)
)

(defrule re-ask
	(declare (salience 300))
	?attr<-(id-attr ?v&:(neq ?v 0))
	(id-attributo (attributo ?at) (id ?v))
	?a<-(attributo (nome ?at)(padre ?p))
	?templ<-(domande (nome ?at)(testo ?t)(valori $?val))
	?d<-(domandaModifica si)
	?s<-(descrizione ok)
	=>
	(delayed-do-for-all-facts ((?conStessoNome attributo)) (eq ?conStessoNome:nome ?at) (retract ?conStessoNome))	
	(retract-attributi-senza-padre)
    (delayed-do-for-all-facts ((?b blocca)) ?b (retract ?b))
	(delayed-do-for-all-facts ((?m metaR)) ?m:nome (retract ?m))
	(delayed-do-for-all-facts ((?aid id-attributo)) ?aid (retract ?aid))	
	(retract ?d)
	(retract ?s)
	(retract ?attr)
	(bind ?risposta (Domanda ?t "" $?val))
	(assert (attributo (nome ?at)(valore ?risposta)(cf 1.0)(padre ?p)))
	(delayed-do-for-all-facts ((?a attributo)) ?a  (modify ?a (cf ?a:cf))); con questa modifica permetto la riattivazione delle regole
	(bind ?*attributoId* 0)
	(bind ?*metaId* 0)	
)


	
 




