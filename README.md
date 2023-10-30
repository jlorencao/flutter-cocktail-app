# cocktail_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



### Progetto d'esame
Realizzare una mobile app che mostra informazioni su cocktails.

L'app dovrà essere composta da:

- Una schermata iniziale con una bottom bar composta da due tab - ok

- Il primo tab si chiama "Cerca", il secondo tab si chiama "Preferiti" - ok

- Nel primo tab è presente una barra di ricerca. L'utente deve inserire almeno una lettera per poter far partire la ricerca. - ok

  Per la ricerca utilizzare la seguente API:

  https://www.thecocktaildb.com/api/json/v1/1/search.php?s=QUERY -ok

  dove QUERY è il testo inserito dall'utente. - ok

  L'api risponde con una lista di cocktail.- ok

  Mostrare una lista scrollabile di card (utilizzare il widget ListView). - ok

  Ogni card deve mostrare l'immagine del cocktail (parametro strDrinkThumb) e il nome (parametro strDrink). - ok

  Se la ricerca non restituisce nessun risultato mostrare un testo che invita l'utente a modificare il testo inserito. 

  Cliccando su una card si apre la pagina di dettaglio del drink, vedi sotto. 

- Nel secondo tab è presente la lista dei preferiti.

  La lista è uguale a quella descritta sopra: mostra per ogni drink l'immagine e il nome.

  Se l'utente non ha ancora inserito nessun preferito mostrare un testo che invita l'utente ad aggiungere un cocktail tra i preferiti.

  Cliccando su una card si apre la pagina di dettaglio del drink, vedi sotto.

- Pagina di dettaglio del cocktail

  Per il dettaglio utilizzare la seguente API:

  https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=ID

  dove ID è l'id del drink ricevuto nell'api precedente. - ok

  In questa schermata mostrare l'immagine (parametro strDrinkThumb), il nome del cocktail (parametro strDrink), gli ingredienti (parametri strIngredient1, strIngredient2 e successivi) e le istruzioni per farlo.

  Se è presente il parametro strInstructionsIT mostrare la descrizione in italiano, altrimenti mostrare quella in inglese strInstructions.

  Deve essere presente un bottone per aggiungere/rimuovere il drink dai preferiti.



La realizzazione grafica è libera.



Suggerimenti:

- Per il salvataggio dei preferiti utilizzare le sharedPreferences o un database. Non è necessario salvare tutto l'oggetto quando viene aggiunto nei preferiti. Basta salvare l'id, il nome e l'url dell'immagine.

- Non è necessario mappare tutti i parametri restituiti dalle API, si possono mappare solo i dati necessari.



Valutazione:

Organizzazione del codice e architettura [3 punti]

Cura grafica [3 punti]

Animazioni [3 punti]

Home con bottom bar [2 punti]

Pagina di ricerca [8 punti]

Dettaglio [5 punti]

Pagina preferiti e gestione preferiti nel Dettaglio [5 punti]

Il punteggio massimo del progetto è 20 punti. Se si ottengono più di 20 punti verrà comunque assegnato 20.



Eventuali progetti alternativi devono essere valutati caso per caso.



Il progetto può essere fatto in coppia. Le coppie devono essere comunicate in anticipo.



La valutazione sarà basata sulla consegna e l'esposizione dell'elaborato.

