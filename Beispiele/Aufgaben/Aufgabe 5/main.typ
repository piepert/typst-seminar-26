/*
Im Template weitere Regeln einfügen:
- Schriftgröße: 12pt
- Nummerierung der Übrerschriften: 1, 1.1., 1.1.1, ...
- Blocksatz
- den Titel des Dokuments zentrieren
*/


// habe hier ein grid (ähnlich zu table) benutzt um den Kopf aufzusetzen
#set page(
    margin: (top: 3cm),
    header: {
        set text(size: 0.75em)

        grid(
            columns: (1fr, auto),
            align(left, [
                Universität Rostock,
                Institut für Philosophie \
                Seminar: Wirtschaftsethik
            ]),

            align(right, [
                Max Mustermann \
                #datetime.today().display("[day].[month].[year]")
            ]),
        )

        line(length: 100%)
    },
)

#title[Sitzung 7 -- John Ruskin: Diesem letzten]

= Problematisierung
Zu Beginn des Seminars wurden zwei Bilder gezeigt -- ein Bild eines Tagesschau-Artikels, in dem von großen Stellenentlassungen bei dem Unternehmen "Thyssenkrupp" gesprochen wird, und ein Instagram-Post der Tagesschau, in dem von den schlechten Arbeitsbedingungen bzw. der Ausbeutung von LKW-Fahrern gesprochen wird. Die Frage war, wie sich diese in Bezug zum Text von Ruskin verhalten. Durch beide Beispiele werden zwei Grundsätze von Ruskin verdeutlicht: zum einen die Forderung nach sicheren Arbeitsplätzen mit festen Löhnen, zum anderen die Ablehnung des kalten Nutzenmaximierungsprinzips der Menschen, hier besonders aus Sicht der Arbeitgeber.

= Textgliederung

== Unschlüssigkeit der Nationalökonomie
Eine zentrale These der klassischen Nationalökonomie im Sinne des Laissez-faire Liberalismus ist, dass die emotionalen und sozialen Veranlagungen des Menschen wechselhaft sind und ignoriert werden können. Stattdessen seien die Veranlagungen Gier und Habsucht stetig und grundlegend für jede Handlung. Das Nutzenmaximierungsprinzip besagt, dass der Mensch versucht den größtmöglichen Vorteil für sich selbst mit dem geringsten Aufwand zu erreichen. Ruskin stimmt der Argumentation dieser These und ihrer Schlussfolgerung zu, kritisiert jedoch die Wahrheit der Grundannahmen: Das Argument sei demnach gültig, jedoch nicht schlüssig.#footnote[Ein gültiges Argument ist ein solches, bei dem die Konklusion aus den Annahmen logisch folgt. _Wenn_ man die Prämissen als wahr annimmt, dann kann die Konklusion auch nur wahr sein. Das heißt aber nicht, dass die Prämissen auch wahr sein müssen. Ein schlüssiges Argument ist ein gültiges, bei dem die Annahmen auch _tatsächlich_ wahr sind.] Der Mensch sei nach Ruskin eben kein kaltes, rechnendes und gewinnsüchtiges Wesen, sondern eben auch eines mit Seele.

== Beziehung zwischen Arbeitgeber und Arbeitnehmer
Dazu zählen die Pflichten des Arbeitgebers gegenüber dem Arbeitnehmer und die soziale Verantwortung des Arbeitgebers. Ruskin geht hier deskriptiv auf eine Beobachtung ein: Arbeiter, die ihrem Arbeitgeber *zugeneigt* sind, arbeiten Besser. *Zuneigung* ist nach Ruskin eine treibende Kraft. Dies ist ein zentraler Punkt, der von der klassischen Nationalökonomie nicht mit betrachtet wird. Abneigung soll vermieden werden, fokussiert werden soll die persönliche Beziehung und Fürsorge des Arbeitgebers zum Arbeitnehmer.

Der Begriff der *guten Arbeit* wurde definiert als bereitwillige Arbeit, die im Sinne des Wohles eines Arbeitgebers geschieht (vgl. S.~255).

== Richtiges und natürliches System: Fester Lohn (und sicherer Arbeitsplatz)
Aus dem Vorherigen ergeht, dass man sich beschäftigen muss, wie Zuneigung entsteht, kultiviert und erhalten werden kann. Geeignet dafür sind sichere Arbeitsplätze und Lohnstabilität. Statt einem nutzenmaximierenden Arbeitgeber, der jede Gewinnchance für sich ausschlachtet, soll hier eine Selbstlosigkeit eintreten, die das Beste für alle erwirtschaftet.

Was im Seminar nicht besprochen wurde, ist die Argumentation Ruskins für einen festen Lohn: Der Lohn eines Arbeiters sollte nicht anhand seiner Qualität gemessen werden. Jeder Arbeiter solle den gleichen Lohn erhalten. Unklar ist, inwiefern die Gleichheit gehen soll. Alle Menschen des gleichen Berufes? Alle Menschen eines Berufes in einem Land/Ort/Stadt? Wie differenziert muss diese "Gleichheit" sein? Die Argumentation fährt jedoch so fort, dass das Prinzip, schlechtere Arbeit schlechter zu bezahlen, in Kombination mit der Konzentration auf eine Kostenreduktion darin mündet, dass schlechte Arbeit attraktiver wird. Daher solle sowohl das eine als auch das andere entfallen: Man achte auf qualitativ hochwertige Arbeit und bezahle diese untereinander vergleichbar.

Wenn daher alle gleich bezahlt werden, wird sich automatisch der durchsetzen, der dafür den Preis die beste Arbeit leistet und nicht der, der für einen Auftrag am wenigsten nimmt.

== Ansehen und Pflichten der Berufe
Ruskin stellt 5 hohe intellektuelle Berufsgruppen heraus, die jeweils ein Grundbedürfnis des Volkes erfüllen:
+ Der Soldat verteidigt das Volk.
+ Der Prediger belehrt das Volk.
+ Der Arzt hält das Volk gesund.
+ Der Rechtsgelehrter wahrt die Rechte des Volkes.
+ Der Kaufmann versorgt das Volk.

Jeder soll dabei alles für seinen Beruf geben und damit für die Erhaltung des Volkes. Dabei folgt er einer Kombination aus Paternalismus und der goldenen Regel: Jeder solle so handeln, als ob die Handlung seinen eigenen Sohn betreffen würde.

Der Kaufmann hat hier eine besondere Aufgabe, da er mit der Versorgung des Volkes viele Untergebene beschäftigen kann und diese angemessen leiten und Interessen abwägen muss. Das Ansehen des Kaufmannes ist, obwohl er diese wichtige Aufgabe erfüllt, gesellschaftlich gering, wenn er dem Gedanken der klassischen Nationalökonomie folgt und kalt und nutzenmaximierend -- allein an seinem eigenen Vorteil interessiert -- handelt. Dies grenze an Betrug, was dann aber kein Handel mehr sei. Dementsprechend kann ein wahrer Kaufmann nicht rein nach dem Nutzenmaximierungsprinzip handeln.


= Thesenbesprechung
== These: Der Aspekt der Zuneigung stärkt die Arbeitsmoral.
Im Alltag kann man dies sehen: bei Freunden und Familie arbeitet man lieber, mehr und besser. Dies könnte auf die Zuneigung den Angehörigen gegenüber zurückgeführt werden. Heutzutage in der Arbeitswelt kommt es jedoch auf den Arbeitgeber und die Struktur des Unternehmens an, ob Zuneigung entsteht. Bei Großunternehmen ist nicht ganz klar, wie so etwas umgesetzt werden soll. Eine angemessene Firmenstruktur könnte Abhilfe schaffen -- die Zuneigung eine*r Filialleiter*in gegenüber kann ausreichend sein, statt dass man direkt Zuneigung zum Vorstand des Großunternehmens haben muss. Hinreichend ist Zuneigung im Unternehmen, wem gegenüber diese gelten muss, ist unklar und muss evtl. nicht das Oberhaupt sein.

Fraglich ist außerdem, wo die Grenze ist. Wann wird Zuneigung zu einem Problem? Endet sie in Freundschaft -- was ist dann mit Kündigungen? Soziale Konflikte können bei zu viel Zuneigung entstehen. Auf einer professionellen Ebene zu bleiben könnte sich hier von Vorteil erweisen. Ruskin würde wahrscheinlich auch nicht so weit gehen, Zuneigung mit Freundschaft gleichzusetzen. Ihm geht es nur um die Kritik des reinen Ausbeutergedankens.

== These: Dem wahren Kaufmann dürfte sein Gewinn nicht sein Lebenszweck sein.
Lebenszwecke kann es mehrere geben -- aber der oberste bzw. der Hauptzweck kann der Gewinn nicht sein, da dies gegen die anderen Erläuterungen von Ruskin verstoßen und im Prinzip der klassischen Nationalökonomie enden würde. Der Hauptzweck muss damit ein anderer sein, aber der Gewinn muss immer noch im Zentrum stehen. Wird der Gewinn aus den Augen verloren, könnte es zu großen Verlusten und damit zu Unsicherheit für die Beteiligten kommen. Das ist auch nach Ruskin keine wünschenswerte Alternative.

= Fazit
Insgesamt kann für den Text festgestellt werden, dass er den Moral- und Verantwortungsaspekt wieder mit aufnimmt. Während die anderen Texte, die im Seminar seit Smith besprochen wurden, diese nicht aufgreifen, nehmen Ruskin und Smith sich eine moralische Grundlegung der Wirtschaft vor.

