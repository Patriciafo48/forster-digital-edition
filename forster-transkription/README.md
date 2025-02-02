<!DOCTYPE html>
<html lang="de">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Seite 1 | Georg Forster Transkription</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      line-height: 1.6;
      margin: 0;
      padding: 20px;
      background-color: #f9f9f9;
      color: #333;
    }

    header, footer {
      width: 100%;
      padding: 20px;
      background-color: #1e1e1e;
      color: #fff;
      text-align: center;
    }

    .content {
      display: flex;
      max-width: 1200px;
      margin: 20px auto;
      gap: 20px;
      background: #fff;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      padding: 20px;
    }

    .original-image {
      flex: 1;
      text-align: center;
    }

    .original-image img {
      max-width: 100%;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }

    .transcription {
      flex: 2;
      padding: 20px;
    }

    .transcription h2 {
      margin-top: 0;
      color: #444;
    }
  </style>
</head>
<body>

  <!-- Header -->
  <header>
    <h1>Georg Forster Transkription</h1>
  </header>

  <!-- Content -->
  <div class="content">
    <!-- Original Image -->
    <div class="original-image">
      <img src="0001_p017.jpg" alt="Original Text Seite 1">
    </div>

    <!-- Transcription -->
    <div class="transcription">
      <h2>Transkription der Seite</h2>
      <div id="transcription-output"></div>
    </div>
  </div>

  <!-- Footer -->
  <footer>
    <p>&copy; 2024 Digital Humanities Projekt</p>
  </footer>

  <!-- Script zum Laden der XML-Datei -->
  <script>
    function loadXML(xmlFile) {
      fetch(xmlFile)
        .then(response => response.text())
        .then(xmlString => {
          const parser = new DOMParser();
          const xmlDoc = parser.parseFromString(xmlString, "application/xml");
          displayTranscription(xmlDoc);
        })
        .catch(error => console.error("Fehler beim Laden der XML-Datei:", error));
    }

    function displayTranscription(xmlDoc) {
      const outputDiv = document.getElementById("transcription-output");
      outputDiv.innerHTML = "";

      // Alle TextRegionen durchlaufen und anzeigen
      const textRegions = xmlDoc.getElementsByTagName("TextRegion");
      for (let i = 0; i < textRegions.length; i++) {
        const textEquivs = textRegions[i].getElementsByTagName("Unicode");
        if (textEquivs.length > 0) {
          const p = document.createElement("p");
          p.textContent = textEquivs[0].textContent;
          outputDiv.appendChild(p);
        }
      }
    }

    // Lade die XML-Datei beim Start
    window.onload = function () {
      loadXML("0001_p017.xml");
    };
  </script>
</body>
</html>

