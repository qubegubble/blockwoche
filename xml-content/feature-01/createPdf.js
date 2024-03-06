/**
 * Wäre call für Java funktion zum FO-PDF zu kreiren.
 * Jedoch konnten wir diese nicht ganz hinbringen. Zusätzlich wäre ein Java Webserver benötigt.
 * Java funktion liegt unter xslfo/src/main/java.
 */

async function createPdf(event) {
    event.preventDefault();

    const response = await fetch('http://localhost:8080/xslfo-1.0-SNAPSHOT/generate-pdf');

    if(response.ok) {
        const blob = await response.blob();
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.style.display = 'none';
        a.href = url;
        a.download = 'document.pdf';
        document.body.appendChild(a);
        a.click();
        window.URL.revokeObjectURL(url);
    } else {
        console.error('The request failed');
    }
}