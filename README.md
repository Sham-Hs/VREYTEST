<h1>Projektbeschreibung: </h1>
Ein Ruby on Rails MVC‑Projekt mit relationaler Datenbank, das den täglichen Stromverbrauch eines Hauses erfasst und visualisiert. Verbrauchsdaten werden im 15‑Minuten‑Intervall aus einer Mock‑API importiert und in der Datenbank gespeichert. Ziel ist es, Markt- und Messe-Zähler getrennt auszuwerten, die täglichen Verbrauchswerte zu exportieren und die Differenz für jeden Tag als „Solarverbrauch“ zu berechnen. Auf dem Dashboard wird der tägliche, gesamte und durchschnittliche Solarverbrauch angezeigt.


<h2>Bereits umgesetzt: </h2>

DB-Modelle: Haus, Unit, Meter und Measurement mit funktionierenden ActiveRecord-Associations.

Enums & Validierungen: Zähler-Typen (market_location, metering_location) und location_id-Validierungen sind implementiert.

Service-Klasse DailyConsumptionCal mit Methoden:

    total_consumption_by_type — unterscheidet Verbrauch nach Zählertyp.
    
    total_solar — berechnet die Differenz zwischen Markt- und Messe-Verbrauch.
    
    avg_solar — liefert den durchschnittlichen Tagesverbrauch.
    
    API-Import-Service holt Daten via HTTP von der Mock-API und speichert sie als Measurement.


<h2>Noch in Arbeit </h2>

Die Methode import_consumption_data aus DailyConsumptionCal muss in einen einsatzfähigen Rake-Task eingebunden werden, damit man den Datenimport bequem starten kann.

Controller & View:Der Haus-Controller und die passende View (app/views/haus_show.html.erb) sind noch nicht fertig.



<h2>Setup</h2>
1.Clone the repository: 

    git clone <repository-url>
    cd VREY
2.Install the dependencies:

    bundle install
    
3.Rails Migration

    bin/rails db:create db:migrate
    
4.Start application

    bin/rails server
