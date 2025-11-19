import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum MessageSender { user, ai }

class Message {
  final String text;
  final MessageSender sender;
  final DateTime timestamp;

  Message({required this.text, required this.sender, required this.timestamp});
}

class GeminiService {
  static const String _apiKey = "AIzaSyA8J3ua8aa_WYvC1P64NaxvkPbgEFeKPUQ";

  // ✅ MODELO CORRECTO: gemini-2.0-flash (disponible según tu lista)
  static const String _model = "gemini-2.0-flash";
  static const String _baseUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/$_model:generateContent";

  static Future<String> getFinancialResponse(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse("$_baseUrl?key=$_apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": userMessage},
              ],
            },
          ],
          "generationConfig": {
            "temperature": 0.7,
            "maxOutputTokens": 1000,
            "topP": 0.8,
            "topK": 40,
          },
          "safetySettings": [
            {
              "category": "HARM_CATEGORY_HARASSMENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE",
            },
            {
              "category": "HARM_CATEGORY_HATE_SPEECH",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE",
            },
          ],
          "systemInstruction": {
            "parts": [
              {
                "text":
                    "Eres WealthMind, un asesor financiero personal especializado en finanzas personales. Tu rol es:\n\n"
                    "• Brindar consejos prácticos sobre ahorro, inversión y presupuestos\n"
                    "• Ayudar con eliminación de deudas y educación financiera\n"
                    "• Ser claro, motivador y conciso en tus respuestas\n"
                    "• Mantener un tono profesional pero amigable\n"
                    "• Mantente solo en el ámbito financiero y no salgas de él\n\n"
                    "• Recuerda que tu debes de guiar al usuario hacia buenas prácticas financieras, no lo arrojes a riesgos innecesarios ya que puede no tener el conocimiento completo de como hacerlo.\n"
                    "• Responder siempre en español\n"
                    "• Evitar recomendaciones de inversión específicas o consejos legales\n\n"
                    "Ejemplo de respuestas efectivas:\n"
                    "- 'Para ahorrar más, te sugiero el método 50-30-20...'\n"
                    "- 'Para reducir deudas, prioriza las de mayor interés...'\n"
                    "- 'Un buen presupuesto incluye categorías como...'",
              },
            ],
          },
        }),
      );

      // ✅ MANEJO DE RESPUESTAS CON SWITCH
      switch (response.statusCode) {
        case 200:
          final data = jsonDecode(response.body);
          final candidates = data["candidates"];
          if (candidates != null && candidates.isNotEmpty) {
            final content = candidates[0]["content"];
            if (content != null) {
              final parts = content["parts"];
              if (parts != null && parts.isNotEmpty) {
                final responseText = parts[0]["text"];
                print("✅ Respuesta exitosa de Gemini!");
                return responseText;
              }
            }
          }
          return "No recibí una respuesta clara. ¿Podrías reformular tu pregunta?";

        case 400:
          return "❌ Error en la solicitud. Verifica el formato de los datos.";

        case 401:
          return "🔐 API Key no válida o expirada.";

        case 403:
          return "🔒 Acceso denegado. Verifica los permisos de tu API Key.";

        case 404:
          return "🌐 Modelo no disponible. Contacta con soporte.";

        case 429:
          return "⏰ Límite de solicitudes excedido. Espera unos minutos.";

        case 500:
          return "⚙️ Error interno del servidor de Google.";

        default:
          return "⚠️ Error del servidor (${response.statusCode}). Intenta nuevamente.";
      }
    } catch (e) {
      print("💥 Error de conexión: $e");
      return "🔌 Error de conexión: Verifica tu internet.";
    }
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _messages.add(
      Message(
        text:
            "Hola 👋, soy WealthMind, tu asesor financiero personal.\n\n"
            "💡 **¿En qué puedo ayudarte hoy?**\n\n"
            "• 💰 Presupuestos y ahorro\n"
            "• 📈 Inversiones básicas\n"
            "• 🏦 Eliminación de deudas\n"
            "• 🎯 Metas financieras\n\n"
            "¡Estoy listo para ayudarte! 🤖",
        sender: MessageSender.ai,
        timestamp: DateTime.now(),
      ),
    );
  }

  void _sendMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty || _isLoading) return;

    setState(() {
      _messages.insert(
        0,
        Message(
          text: text,
          sender: MessageSender.user,
          timestamp: DateTime.now(),
        ),
      );
      _isLoading = true;
    });

    _textController.clear();

    final response = await GeminiService.getFinancialResponse(text);

    setState(() {
      _messages.insert(
        0,
        Message(
          text: response,
          sender: MessageSender.ai,
          timestamp: DateTime.now(),
        ),
      );
      _isLoading = false;
    });

    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Widget _buildMessage(Message message) {
    final isUser = message.sender == MessageSender.user;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 16,
                child: Text(
                  "WM",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isUser ? Colors.blueAccent : Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft:
                      isUser
                          ? const Radius.circular(16)
                          : const Radius.circular(4),
                  bottomRight:
                      isUser
                          ? const Radius.circular(4)
                          : const Radius.circular(16),
                ),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: isUser ? Colors.white : Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          if (isUser)
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                radius: 16,
                child: Icon(Icons.person, color: Colors.white, size: 18),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: (_) => _sendMessage(),
              decoration: const InputDecoration.collapsed(
                hintText: "Escribe tu pregunta financiera...",
              ),
              enabled: !_isLoading,
            ),
          ),
          _isLoading
              ? const Padding(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                ),
              )
              : IconButton(
                icon: const Icon(Icons.send, color: Colors.blueAccent),
                onPressed: _sendMessage,
              ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WealthMind - Asesor Financiero",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (_, index) => _buildMessage(_messages[index]),
            ),
          ),
          const Divider(height: 1),
          _buildTextComposer(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'WealthMind - Gemini',
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    ),
  );
}
