from abc import ABC, abstractmethod

class MetodoDepago(ABC):
    @abstractmethod
    
    def proceso_de_pago(self, cantidad:int):
        pass
