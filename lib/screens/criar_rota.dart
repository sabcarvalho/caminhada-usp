import 'package:app/components/campos_criar_rota.dart';
import 'package:app/components/warnings_rota.dart';
import 'package:flutter/material.dart';

class CriarRota extends StatefulWidget {
  const CriarRota({super.key});

  @override
  State<CriarRota> createState() => _CriarRotaState();
}

class _CriarRotaState extends State<CriarRota> {
  int? _tipoSelecionado;
  final List<TipoCaminhada> tipos =[
    TipoCaminhada(titulo: "Rápida", icone: Icons.run_circle_outlined),
    TipoCaminhada(titulo: "Acessível", icone: Icons.wheelchair_pickup_outlined),
    TipoCaminhada(titulo: "Sombra", icone: Icons.nature_people)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Criar Rota")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CampoRota(titulo: "Origem", hint: "Localização Atual"),
            const SizedBox(height: 10),
            CampoRota(titulo: "Destino", hint: "Biblioteca Central"),
            const SizedBox(height: 20),

            SizedBox(
              height: 150,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9,
                children: List.generate(tipos.length, (index) {
                final item = tipos[index];
                final bool selecionado = (_tipoSelecionado == index);

                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    setState(() {
                      _tipoSelecionado = index;
                    });
                  },
                  child: Card(
                    elevation: selecionado ? 6 : 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: selecionado
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    color: selecionado
                        ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                        : Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item.icone,
                          size: 30,
                          color: selecionado
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey[700],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.titulo,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selecionado
                                ? Theme.of(context).colorScheme.primary
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              ),
            ),
            WarningRota(mensagem: "Beba bastante água!"),
            SizedBox(height: 10,),
            WarningRota(mensagem: "Passe Protetor Solar!"),
          ],
        ),
      ),
    );

  }
}

class TipoCaminhada{
  final String titulo;
  final IconData icone;
  
  TipoCaminhada({
    required this.titulo,
    required this.icone
  });
}