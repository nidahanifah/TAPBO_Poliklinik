public interface Cek {
    void cek(String id_pasien);
     void cek(String id_reservasi, String id_pasien);
     public abstract void bayar(String id_reservasi);
}
