from Metodo import MetodoDepago


class TarjetaCredito(MetodoDepago):
    
    def proceso_de_pago(self, cantidad: int):
        print(f"procesando pago de {cantidad} de tipo TarjetaCredito")


class PayPal(MetodoDepago):
    
    def proceso_de_pago(self, cantidad: int):
        print(f"Procesando pago de {cantidad} de tipo Paypal")
        
class CryptoMoneda(MetodoDepago):
    
    def proceso_de_pago(self, cantidad: int):
        print(f"Procensando pago con {cantidad} de tipo Cryptomoneda")