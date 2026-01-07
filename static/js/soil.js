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

// 🔁 AUTO REFRESH SETIAP 1 detik
setInterval(loadSoil, 1000);

// ===== CHART =====
function createChart() {
  const ctx = document.getElementById("moistureChart").getContext("2d");
  const labels = chartData.map((row) =>
    new Date(row.created_at).toLocaleString()
  );
  const data = chartData.map((row) => row.moisture);

  new Chart(ctx, {
    type: "line",
    data: {
      labels: labels,
      datasets: [
        {
          label: "Kelembaban Tanah (%)",
          data: data,
          borderColor: "#2e7d32",
          backgroundColor: "rgba(46, 125, 50, 0.1)",
          fill: true,
          tension: 0.1,
        },
      ],
    },
    options: {
      responsive: true,
      scales: {
        y: {
          beginAtZero: true,
          max: 100,
        },
      },
    },
  });
}

// Buat chart saat halaman load
window.onload = function () {
  createChart();
};
