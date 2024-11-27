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
            container.innerHTML = ""; // Limpia cualquier contenido previo

            colecciones.forEach(coleccion => {
                // Crear un contenedor para cada colección
                const coleccionHTML = `
                <div class="containerObra">
                    <div class="datosObra">
                        <div class="infObra">
                            <h2>${coleccion.nombreCol}</h2>
                            <p>${coleccion.descripcionCol || "Sin descripción"}</p>
                        </div>
                        <button onclick="verMas(${coleccion.idColeccion})">Ver Más</button>
                    </div>
                    <div class="imagenObra">
                        <img src="${coleccion.imagen || 'images/default.jpg'}" alt="${coleccion.nombreCol}">
                    </div>
                </div>
                `;
                container.insertAdjacentHTML("beforeend", coleccionHTML);
            });
        })
        .catch(error => console.error("Error al cargar las colecciones:", error));
});

// Función para manejar el botón "Ver Más"
function verMas(id) {
    window.location.href = `detalleColeccion.html?id=${id}`;
}




