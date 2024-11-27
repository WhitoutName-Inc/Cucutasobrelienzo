let key = 'f055b95b12d748a3a2133ee965c143e1';
let pais = 'us';
let idioma='es'
let url = `https://newsapi.org/v2/everything?q=arte OR pintura OR arte OR lienzos OR manualidades&language=${idioma}&apiKey=${key}`;

let mostrar_noticias = document.getElementById('noticias');
let PaginaActual = 0; 
const noticiasPorPagina = 4; 
let noticias = []; 

fetch(url).then((resp) => resp.json()).then(dato => {
    noticias = dato.articles;
    mostrarNoticias(); 
    mostrarNumerosPaginas(); 
});

function mostrarNoticias() {
    mostrar_noticias.innerHTML = ""; 

    const startIndex = PaginaActual * noticiasPorPagina; 
    const endIndex = startIndex + noticiasPorPagina; 

    const noticiasActuales = noticias.slice(startIndex, endIndex);
    
    noticiasActuales.forEach(function(numero) {
        let div = document.createElement('div');
        div.innerHTML = `
            <img style="max-width:800px" src="${numero.urlToImage}" alt="Imagen de la noticia">
            <h2><a href="${numero.url}" target="_blank">${numero.title}</a></h2>
            <p>${numero.description}</p>
        `;
        mostrar_noticias.appendChild(div);
    });

   
}

function mostrarNumerosPaginas() {
    const totalPages = Math.ceil(noticias.length / noticiasPorPagina);
    const pageNumbersContainer = document.getElementById('pageNumbers');
    pageNumbersContainer.innerHTML = "";

    // Limita a que solo se vea 7 paginas
    const maxVisiblePages = 5; // constante para limitar el numero que se ve
    let startPage = Math.max(0, PaginaActual - Math.floor(maxVisiblePages / 2));
    let endPage = Math.min(totalPages - 1, startPage + maxVisiblePages - 1);

    if (endPage - startPage < maxVisiblePages - 1) {
        startPage = Math.max(0, endPage - maxVisiblePages + 1);
    }

    for (let i = startPage; i <= endPage; i++) {
        const li = document.createElement('li');
        const button = document.createElement('button');
        button.innerText = i + 1;
        button.addEventListener('click', () => {
            PaginaActual = i;
            mostrarNoticias();
            mostrarNumerosPaginas(); 
        });

        if (i === PaginaActual) {
            button.disabled = true; 
            button.style.color = 'red';
        }

        li.appendChild(button);
        pageNumbersContainer.appendChild(li);
    }
}

document.getElementById('previous').addEventListener('click', () => {
    if (PaginaActual > 0) {
        PaginaActual--;
        mostrarNoticias();
        mostrarNumerosPaginas(); 
    }
});

document.getElementById('next').addEventListener('click', () => {
    if ((PaginaActual + 1) * noticiasPorPagina < noticias.length) {
        PaginaActual++;
        mostrarNoticias();
        mostrarNumerosPaginas();
    }
});

//Conexion con base de datos
document.addEventListener('DOMContentLoaded', async () => {
    try {
        const response = await fetch('http://localhost:8080/api/artistas');
        const artistas = await response.json();

        const artistasContainer = document.querySelector('.seccionArtistas');
        artistasContainer.innerHTML = ''; // Limpiar contenido anterior

        artistas.forEach(artista => {
            const artistaDiv = document.createElement('div');
            artistaDiv.classList.add('artista');
            artistaDiv.innerHTML = `
                <img src="${artista.fotoPerfilUrl}" alt="${artista.nombres}">
                <p>${artista.nombres} ${artista.apellidos}</p>
            `;
            artistasContainer.appendChild(artistaDiv);
        });
    } catch (err) {
        console.error("Error al cargar los artistas:", err);
    }
});


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
            container.innerHTML = ""; // Limpia el contenedor antes de agregar elementos

            colecciones.forEach(coleccion => {
                const coleccionHTML = `
                <div class="containerObra">
                    <div class="datosObra">
                        <div class="infObra">
                            <h2>${coleccion.nombreCol}</h2>
                            <p>${coleccion.descripcionCol || "Sin descripción"}</p>
                        </div>
                        <div class="infArtista">
                            <h3>Artista: ${coleccion.artista.nombres || "Desconocido"} ${coleccion.artista.apellidos || ""}</h3>
                        </div>
                        <button onclick="verMas(${coleccion.idColeccion})">Ver Más</button>
                    </div>
                    <div class="imagenObra">
                        <img src="${coleccion.artista.fotoPerfilUrl || 'images/default.jpg'}" alt="${coleccion.nombreCol}">
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

