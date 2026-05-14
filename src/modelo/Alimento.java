package modelo;

public class Alimento {
    private int idAlimento;
    private String nombre;
    private String tipo;
    private int calorias;
    private String temporada;

    public Alimento() {
    }

    public Alimento(int idAlimento, String nombre, String tipo, int calorias, String temporada) {
        this.idAlimento = idAlimento;
        this.nombre = nombre;
        this.tipo = tipo;
        this.calorias = calorias;
        this.temporada = temporada;
    }

    public int getIdAlimento() {
        return idAlimento;
    }

    public void setIdAlimento(int idAlimento) {
        this.idAlimento = idAlimento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getCalorias() {
        return calorias;
    }

    public void setCalorias(int calorias) {
        this.calorias = calorias;
    }

    public String getTemporada() {
        return temporada;
    }

    public void setTemporada(String temporada) {
        this.temporada = temporada;
    }
}
