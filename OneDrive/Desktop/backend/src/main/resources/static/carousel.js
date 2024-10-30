const botonNext = document.getElementById('nextButton');
const botonPrev = document.getElementById('prevButton');

const obra = document.getElementsByClassName("obra");
let indice = 0;

obra[indice].style.display = 'flex';
obra[indice].classList.add('mostrar');


function ocultarObra(indice) {
  obra[indice].classList.remove('mostrar');
  setTimeout(() => {
      obra[indice].style.display = 'none';
  }, 500); // Espera el tiempo de la transición para ocultar el display
}


botonNext.addEventListener('click', () => {

  ocultarObra(indice);

  obra[indice].classList.remove('mostrar');

  obra[indice].style.display = 'none';
  if(indice>=5){
    indice=0;
  }else{
    indice=indice+1;
  }
  obra[indice].style.display = 'flex';

  setTimeout(() => {
    obra[indice].classList.add('mostrar');
}, 10); // Pequeño retardo para activar la transición
})


botonPrev.addEventListener('click', () => {

  ocultarObra(indice);

  obra[indice].classList.remove('mostrar');


  obra[indice].style.display = 'none';
  if (indice === 0) {
    indice = obra.length - 1;
  } else {
    indice = indice - 1;
  }
  obra[indice].style.display = 'flex';

  obra[indice].style.display = 'block';
    setTimeout(() => {
        obra[indice].classList.add('mostrar');
    }, 10);
});
