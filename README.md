# Taller 1 — Registro Estudiantil

> **Rama:** `RegistroEstudiante`  
> **Asignatura:** Diseño de Interfaces de Usuario  
> **Fecha:** Febrero 2026
> **Rama Main:** https://github.com/Landrea28/Dise-oDeInterfacesDeUsuario/tree/main 

---

## Descripción del taller

Este taller consiste en el desarrollo de un **portal web de registro estudiantil** para una institución universitaria (basado en la Universidad Konrad Lorenz). El objetivo es aplicar los fundamentos de diseño de interfaces accesibles, semánticas y responsivas usando únicamente **HTML5 y CSS3 puro**, sin frameworks ni librerías externas.

El sitio cuenta con dos páginas principales: una **página de inicio** que presenta los servicios académicos con un carrusel de imágenes, y una **página de registro** con un formulario que recopila los datos del estudiante.

---

## Estructura del repositorio

Cada taller del curso vive en su propia rama. Esta rama corresponde al **Taller 1**.

```
RegistroEstudiante/          ← rama de este taller
│
├── index.html               ← Página del formulario de registro
├── inicio.html              ← Página de inicio / bienvenida
├── styles.css               ← Hoja de estilos compartida entre ambas páginas
└── README.md                ← Este archivo
```

---

## Páginas del proyecto

### `inicio.html` — Página de inicio
Pantalla de bienvenida de la universidad. Contiene:
- **Header fijo** con logo institucional y menú de navegación.
- **Sección de servicios** organizada en una cuadrícula responsiva con tres tarjetas:
  - **Programas:** carrusel de imágenes con programas académicos disponibles (Psicología, Ingeniería de Sistemas, Inteligencia Artificial).
  - **Noticias:** carrusel con imágenes de eventos y logros de la institución.
  - **Admisiones:** tarjeta con acceso directo al formulario de registro.
- **Footer** con información de contacto, dirección física y aviso de derechos de autor.

### `index.html` — Formulario de registro
Página para que los nuevos estudiantes inicien su proceso de inscripción. Contiene:
- **Header fijo** idéntico al de la página de inicio (navegación consistente).
- **Formulario de registro** con los siguientes campos:
  | Campo | Tipo | Obligatorio |
  |---|---|---|
  | Nombre Completo | Texto | Sí |
  | Documento de Identidad | Texto | Sí |
  | Correo Electrónico | Email | Sí |
  | Programa Académico | Select (desplegable) | Sí |
- **Footer** con contacto institucional.

---

## Hoja de estilos — `styles.css`

Archivo CSS compartido por ambas páginas. Aplica:

- **Reset universal** para estandarizar estilos entre navegadores.
- **Variables CSS (`:root`)** para mantener la paleta de colores institucional de forma centralizada:
  - Azul institucional: `#003366`
  - Amarillo institucional: `#f2b705`
- **Header fijo** (`position: fixed`) con altura controlada de 60px.
- **Layout responsivo** con Flexbox y CSS Grid (`repeat(auto-fit, minmax(...))`).
- **Carrusel de imágenes** horizontal con scroll suave (`overflow-x: auto`).
- **Formulario estilizado** con estados `:focus`, validaciones visuales y clases de accesibilidad (`.sr-only`).
- **Footer** con fondo oscuro y distribución flexible del contenido.

---

## Conceptos aplicados

| Concepto | Descripción |
|---|---|
| **Semántica HTML5** | Uso de `<header>`, `<main>`, `<footer>`, `<nav>`, `<section>`, `<article>`, `<address>`, `<fieldset>`, `<legend>` |
| **Accesibilidad (a11y)** | Atributos `aria-label`, `aria-required`, `aria-describedby`; clase `.sr-only` para texto solo para lectores de pantalla |
| **Responsividad** | `meta viewport`, Flexbox, CSS Grid con `auto-fit` y `minmax()` |
| **Variables CSS** | Paleta centralizada en `:root` para fácil mantenimiento |
| **Formularios** | Tipos de input semánticos (`email`, `text`), `autocomplete`, `placeholder`, validaciones nativas con `required` |
| **Navegación consistente** | El mismo header y footer se repite en ambas páginas para coherencia visual |

---

## Cómo visualizar el proyecto

No requiere instalación de ningún servidor ni dependencias. Solo:

1. Clona el repositorio y cambia a esta rama:
   ```bash
   git clone <URL-del-repositorio>
   git checkout RegistroEstudiante
   ```
2. Abre el archivo `inicio.html` directamente en tu navegador (doble clic o arrastrar al navegador).
3. Desde ahí, el menú de navegación te permite ir a la página de **Registro** (`index.html`).

> Puedes también usar la extensión **Live Server** de VS Code para recargar automáticamente al guardar cambios.

---

## Organización general del repositorio

Este repositorio agrupa los talleres del curso **Diseño de Interfaces de Usuario**. Cada taller se desarrolla en una rama independiente para mantener el historial limpio y permitir la revisión individual de cada entrega:

```
main                     ← Rama principal (puede contener resumen general)
├── RegistroEstudiante   ← Taller 1: portal de registro estudiantil
├── Taller2              ← (próximas entregas...)
└── ...
```

Esto permite que cada taller sea revisado de forma aislada sin interferir con las demás entregas.

---

## Autor

Estudiante del curso de Diseño de Interfaces de Usuario.  
Proyecto desarrollado con fines **exclusivamente educativos**.

&copy; 2026 — Basado en la identidad visual de la Universidad Konrad Lorenz.
