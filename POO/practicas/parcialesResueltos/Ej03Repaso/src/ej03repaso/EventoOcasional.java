package ej03repaso;

/*
 Un evento ocasional es un recital que además tiene el motivo (a beneficio, show de TV
o show privado), el nombre del contratante del recital y el día del evento.
 */
/**
 *
 * @author ceciliamarfia
 */
public class EventoOcasional extends Recital {

    private String motivo;
    private String nombreDelContratante;
    private String diaDelEvento;

    public EventoOcasional(String motivo, String nombreDelContratante, String diaDelEvento, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.motivo = motivo;
        this.nombreDelContratante = nombreDelContratante;
        this.diaDelEvento = diaDelEvento;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreDelContratante() {
        return nombreDelContratante;
    }

    public void setNombreDelContratante(String nombreDelContratante) {
        this.nombreDelContratante = nombreDelContratante;
    }

    public String getDiaDelEvento() {
        return diaDelEvento;
    }

    public void setDiaDelEvento(String diaDelEvento) {
        this.diaDelEvento = diaDelEvento;
    }

    /*iii. El evento ocasional debe saber responder al mensaje actuar de manera distinta:
 Si es un show de beneficencia se imprime la leyenda “Recuerden colaborar con…“
seguido del nombre del contratante.
 Si es un show de TV se imprime “Saludos amigos televidentes”
 Si es un show privado se imprime “Un feliz cumpleaños para…” seguido del
nombre del contratante.
Independientemente del motivo del evento, luego se imprime el listado de temas como
lo hace cualquier recital.*/
    @Override
    public void actuar() {
        if (motivo.equals("Show de beneficiencia")) {
            System.out.println("Recuerden colaborar con… " + nombreDelContratante);
        } else {
            if (motivo.equals("Show de TV")) {
                System.out.println("Saludos amigos televidentes");
            } else {
                if (motivo.equals("Show privado")) {
                    System.out.println("Un feliz cumpleaños para..." + nombreDelContratante);
                }
            }
            super.actuar();
        }

    }

    /*iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo
siguiente. Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un show de TV
y 150000 si es privado. */
    @Override
    public double calcularCosto() {
        if (motivo.equals("Show de beneficiencia")) {
            return 0;
        } else if (motivo.equals("Show de TV")) {
            return 50000.0;
        }
        return 150000.0;
    }
}
