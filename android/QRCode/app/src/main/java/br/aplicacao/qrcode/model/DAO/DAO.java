package br.aplicacao.qrcode.model.DAO;


import java.util.List;

public interface DAO <T> {
    List<T> getIntercession();
    List<T> getAll();
    boolean insert(T object);
}
