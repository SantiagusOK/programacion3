from Tipos import *
from Metodo import MetodoDepago

def realizarPago(metodoPago : MetodoDepago, cantidad : int):
    metodoPago.proceso_de_pago(cantidad)
    

tarjeta = TarjetaCredito()
paypal = PayPal()
cryptomoneda = CryptoMoneda()


realizarPago(tarjeta, 300)
realizarPago(paypal, 200)
realizarPago(cryptomoneda, 300)