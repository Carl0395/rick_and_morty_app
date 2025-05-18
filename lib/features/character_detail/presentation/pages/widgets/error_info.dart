import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/util.dart';

class ErrorInfo extends StatefulWidget {
  final Color color;
  final Future<void> Function()? onRetry;
  final String? message;
  const ErrorInfo({super.key, required this.color, this.onRetry, this.message});

  @override
  State<ErrorInfo> createState() => _ErrorInfoState();
}

class _ErrorInfoState extends State<ErrorInfo> {
  bool retrying = false;

  @override
  Widget build(BuildContext context) {
    final labelColor =
        Util.isDark(widget.color)
            ? Colors.white
            : Util.darken(widget.color, 0.4);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          SizedBox(height: 20),
          Image.asset('assets/rick_and_morty_surprised.png', width: 200),
          SizedBox(height: 10),
          Text(
            widget.message ?? "Error al cargar la información",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: labelColor),
          ),
          SizedBox(height: 20),
          if (widget.onRetry != null)
            GestureDetector(
              onTap: () async {
                setState(() {
                  retrying = true;
                });
                await widget.onRetry!();
                setState(() {
                  retrying = false;
                });
              },
              child: Container(
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  color: Color(0xFF02AFCA),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child:
                      retrying
                          ? Container(
                            width: 20,
                            height: 20,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                          : Text(
                            'Reintentar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
