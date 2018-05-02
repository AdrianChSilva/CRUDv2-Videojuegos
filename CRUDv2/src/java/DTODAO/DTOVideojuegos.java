package DTODAO;

import java.io.Serializable;

public class DTOVideojuegos implements Serializable {

    private Integer CodVideojuegos;
    private String titulo;
    private String plataforma;
    private String desarrolladora;
    private String publisher;
    private float precio;
    private int stock;

    public DTOVideojuegos() {
        // TODO Auto-generated constructor stubF

    }

    public Integer getCodVideojuegos() {
        return CodVideojuegos;
    }

    public void setCodVideojuegos(Integer codVideojuegos) {
        CodVideojuegos = codVideojuegos;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getPlataforma() {
        return plataforma;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }

    public String getDesarrolladora() {
        return desarrolladora;
    }

    public void setDesarrolladora(String desarrolladora) {
        this.desarrolladora = desarrolladora;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "EscrituraTablaVideojuego [CodVideojuegos=" + CodVideojuegos + ", titulo=" + titulo
                + ", plataforma=" + plataforma + ", desarrolladora=" + desarrolladora + ", publisher="
                + publisher + ", precio=" + precio + ", stock=" + stock + "]" + System.getProperty("line.separator");
    }
}
