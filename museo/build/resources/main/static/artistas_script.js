document.addEventListener("DOMContentLoaded", () => {
    fetch("http://localhost:8080/api/artistas")
        .then(response => {
            if (!response.ok) {
                throw new Error("Error al obtener los artistas");
            }
            return response.json();
        })
        .then(artistas => {
            const container = document.getElementById("artistasContainer");
            container.innerHTML = ""; // Limpia el contenedor

            artistas.forEach(artista => {
                const tarjeta = `
                <div class="tarjetaArtista">
                    <img src="${artista.fotoPerfilUrl || 'images/default.jpg'}" alt="${artista.nombres}">
                    <h2>${artista.nombres} ${artista.apellidos}</h2>
                    <p class="infoContacto"><strong>Edad:</strong> ${artista.edad || 'N/A'}</p>
                    <p class="infoContacto"><strong>Email:</strong> ${artista.email || 'No disponible'}</p>
                    <p class="infoContacto"><strong>Teléfono:</strong> ${artista.telefono || 'No disponible'}</p>
                    <p class="descripcion">${artista.descripcionart || 'Sin descripción disponible'}</p>
                </div>
                `;
                container.insertAdjacentHTML("beforeend", tarjeta);
            });
        })
        .catch(error => {
            console.error("Error al cargar los artistas:", error);
            const container = document.getElementById("artistasContainer");
            container.innerHTML = `<p>No se pudieron cargar los artistas. Intenta más tarde.</p>`;
        });
});
