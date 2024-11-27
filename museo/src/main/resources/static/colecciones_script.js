document.addEventListener("DOMContentLoaded", () => {
    fetch("http://localhost:8080/api/colecciones")
        .then(response => {
            if (!response.ok) {
                throw new Error("Error al obtener las colecciones");
            }
            return response.json();
        })
        .then(colecciones => {
            const container = document.getElementById("coleccionesContainer");
            container.innerHTML = ""; 

            colecciones.forEach(coleccion => {
                const coleccionHTML = `
                <div class="coleccion">
                    <h2>${coleccion.nombrecol}</h2>
                    <p><strong>Artista:</strong> ${coleccion.artista.nombres} ${coleccion.artista.apellidos}</p>
                    <div class="obras">
                        ${coleccion.obras.map(obra => `
                            <div class="obra">
                                <img src="${obra.fotoObraUrl}" alt="${obra.tituloobra}">
                                <h3>${obra.tituloobra}</h3>
                                <p><strong>Técnica:</strong> ${obra.tecnica}</p>
                                <p><strong>Descripción:</strong> ${obra.descripcionobra || 'Sin descripción'}</p>
                            </div>
                        `).join('')}
                    </div>
                </div>
                `;
                container.insertAdjacentHTML("beforeend", coleccionHTML);
            });
        })
        .catch(error => {
            console.error("Error al cargar las colecciones:", error);
            const container = document.getElementById("coleccionesContainer");
            container.innerHTML = `<p>No se pudieron cargar las colecciones. Intenta más tarde.</p>`;
        });
});





