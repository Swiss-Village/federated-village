# 🚀 Swiss-Village Feature To-Do Liste

Die folgende Liste gliedert die Entwicklungs-Features nach Priorität, basierend auf den Zielen des Projekts (MVP, Phase 2, optional) und der Analyse typischer Schweizer Gemeindewebsites.

---

## I. Minimal Viable Product (MVP) Features (Prio 1)

Diese Features bilden die Grundlage für die erste lauffähige, föderationsfähige RoR-Instanz.

| Bereich | Feature | Beschreibung | Swiss-Village Aspekt |
| :--- | :--- | :--- | :--- |
| **Öffentliche Inhalte** | **Nachrichten & Aktuelles** | Ticker/Blog für amtliche Mitteilungen, Abstimmungen und allgemeine News. | **Kern-Content**; Basis für Föderation. |
| | **Veranstaltungskalender** | Übersicht lokaler Feste und Anlässe mit Details (Datum, Ort, Beschreibung). | **Kern-Content**; Teil des ActivityPub-Feeds. |
| | **Gemeinde-Verzeichnis** | Kontaktdaten, Öffnungszeiten, Adressen und Ansprechpartner der Verwaltung. | **Directory MVP**. |
| **Basis-eGov** | **Einfache Formulare (Kontakt/Anfragen)** | Digitale Formulare für allgemeine Anfragen (einfache RoR Formulare). | **Forms MVP**; Start für datenschutzkonforme Erfassung. |
| **Identität & Account** | **Benutzer-Account-Registrierung** | Sicheres, minimales Account-Management für Bürger der Gemeinde (inkl. Datenexport/Löschung). | **Privacy-first**; Basis für Portabilität. |
| | **Admin UI (MVP)** | Geschützter Zugang für Gemeindemitarbeitende zur Verwaltung von Inhalten und Accounts. | **Admin UI Goal**. |
| **Föderation** | **ActivityPub Outbox (Content-Sharing)** | Implementierung, um *News* und *Events* als ActivityStreams an andere Instanzen zu senden. | **Federation PoC**. |
| **Mobile** | **Mobile App Shell (Public Content)** | Eine native App-Hülle (RN/Flutter), die News und Events von der RoR API konsumiert. | **Mobile Goal**. |

---

## II. Phase 2 Features (Prio 2)

Diese erweitern die MVP-Funktionalität, fokussieren auf Portabilität und tiefergehende eGov-Services.

| Bereich | Feature | Beschreibung | Swiss-Village Aspekt |
| :--- | :--- | :--- | :--- |
| **e-Government** | **Erweiterte Formular-Workflows** | Komplexe, mehrseitige digitale Anträge (z.B. Adressänderung, Gesuche). | **Admin-Entlastung**; Erfordert **E2E-Verschlüsselung**. |
| | **Dokumenten-Repository** | Verwaltung und Bereitstellung von Protokollen, Reglementen und offiziellen Dokumenten. | **Transparenz & Auditing**. |
| **Föderation** | **ActivityPub Inbox (Content-Subscription)** | Fähigkeit, Inhalte (News/Events) von abonnierten anderen Instanzen zu empfangen und anzuzeigen. | **Content-Föderation**. |
| | **Identitäts-Portabilität (WebFinger)** | Mechanismus zur digitalen Übertragung des Benutzerkontos beim Umzug in eine andere Swiss-Village Gemeinde. | **USP & Portability Goal**. |
| **Mobile** | **Offline-Zugriff & Synchronisation** | Mobile App speichert wichtige Daten lokal und synchronisiert automatisch. | **Mobile UX**; Wichtig für geringe Abdeckung. |

---

## III. Optionale / Langfristige Features (Prio 3)

Diese dienen der weiteren Skalierung und Funktionserweiterung der Plattform.

| Bereich | Feature | Beschreibung | Swiss-Village Aspekt |
| :--- | :--- | :--- | :--- |
| **Community** | **Vereinsverzeichnis & News-Feeds** | Detaillierte Liste lokaler Vereine mit eigenen News-Kanälen. | **Community-Fokus**. |
| **e-Government** | **Online-Reservationen** | Buchung von Gemeinde-Infrastruktur (Halle, Räume, Bänke) über die Plattform. | **E-Service**. |
| | **Mängelmeldungen** | Bürger können Schäden im öffentlichen Raum (mit optionaler Geo-Lokalisierung) melden. | **Bürgerbeteiligung**. |
| | **Integration Schweizer Dienste** | Optionale, **opt-in** Anbindung an eBill, TWINT oder Schweizer Identity-Services (z.B. SwissID). | **Phase 3 Goal**; Muss streng **Privacy-first** sein. |
| **Technisch** | **Real-Time Chat (Matrix)** | Integration eines sicheren, dezentralen Chat-Dienstes für die Kommunikation mit der Verwaltung. | **Non-Goal initial**; Spätere Erweiterung. |