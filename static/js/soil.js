function loadSoil() {
  fetch("/api/soil")
    .then((response) => response.json())
    .then((data) => {
      // TAMPILKAN NILAI KELEMBABAN
      document.getElementById("moisture").innerText = data.moisture;
      document.getElementById("time").innerText = "Update: " + data.created_at;

      // LOGIKA STATUS TANAH
      let status = document.getElementById("status");

      if (data.moisture < 60) {
        status.innerText = "KERING";
        status.className = "badge kering";
      } else if (data.moisture >= 60 && data.moisture <= 75) {
        status.innerText = "NORMAL";
        status.className = "badge normal";
      } else {
        status.innerText = "BASAH";
        status.className = "badge basah";
      }
    })
    .catch((err) => {
      console.error("Gagal ambil data:", err);
    });
}

// ▶ LOAD DATA SAAT HALAMAN DIBUKA
loadSoil();

// 🔁 AUTO REFRESH SETIAP 1 MENIT
setInterval(loadSoil, 60000);
