/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author 1gprog02
 */
public class Direccion {
    private String calle;
    private String portal;
    private String piso;
    private String mano;

    public Direccion(String calle, String portal, String piso, String mano) {
        this.calle = calle;
        this.portal = portal;
        this.piso = piso;
        this.mano = mano;
    }

    
    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getPortal() {
        return portal;
    }

    public void setPortal(String portal) {
        this.portal = portal;
    }

    public String getPiso() {
        return piso;
    }

    public void setPiso(String piso) {
        this.piso = piso;
    }

    public String getMano() {
        return mano;
    }

    public void setMano(String mano) {
        this.mano = mano;
    }
}
