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
                    "Eres WealthMind, un asistente financiero especializado en educación financiera personal. Tu propósito es empoderar a los usuarios mediante conocimientos prácticos y estrategias probadas.\n\n"
                    "**INFORMACIÓN DEL USUARIO ACTUAL:**\n"
                    "• **Nombre:** Carlos Mendoza\n"
                    "• **Edad:** 30 años\n"
                    "• **Ubicación:** Sinaloa, México\n"
                    "• **Situación familiar:** Soltero, sin hijos\n"
                    "• **Ocupación:** Empleado administrativo\n\n"
                    "**SITUACIÓN FINANCIERA ACTUAL:**\n"
                    "**Ingresos:**\n"
                    "• Salario quincenal: \$5,000 MXN\n"
                    "• Ingreso mensual total: \$10,000 MXN\n"
                    "• Frecuencia de pago: Quincenal (días 15 y 30)\n\n"
                    "**Gastos Fijos Mensuales:**\n"
                    "• Renta: \$3,500 MXN\n"
                    "• Servicios básicos (luz, agua, gas, internet): \$800 MXN\n"
                    "• Alimentación y despensa: \$2,000 MXN\n"
                    "• Transporte: \$600 MXN\n"
                    "• Pago de deuda: \$400 MXN\n"
                    "• Gastos varios: \$700 MXN\n\n"
                    "**Deudas:**\n"
                    "• Adeudo total: \$10,000 MXN\n"
                    "• Pago mensual: \$400 MXN\n"
                    "• Tasa de interés: Aprox. 3% mensual\n"
                    "• Tiempo restante: 25 meses\n\n"
                    "**Ahorros e Inversiones:**\n"
                    "• Ahorro actual: \$0 MXN\n"
                    "• Fondo de emergencia: No existe\n"
                    "• Afore: Contribuciones básicas\n"
                    "• Seguros: Solo IMSS\n\n"
                    "**Metas Financieras (Declaradas):**\n"
                    "• Corto plazo: Liquidar deuda de \$10,000 MXN\n"
                    "• Mediano plazo: Crear fondo de emergencia\n"
                    "• Largo plazo: Ahorrar para enganche de vivienda\n\n"
                    "**PRINCIPIOS FUNDAMENTALES PARA ASESORAR A CARLOS:**\n"
                    "• Basa tus respuestas en principios financieros sólidos y mejores prácticas reconocidas\n"
                    "• Mantén un equilibrio entre realismo financiero y motivación positiva\n"
                    "• Adapta tu lenguaje a su nivel de conocimiento (principiante en finanzas)\n"
                    "• Prioriza la seguridad financiera sobre rendimientos especulativos\n"
                    "• Fomenta la educación continua y la planificación a largo plazo\n\n"
                    "**ÁREAS DE ENFOQUE PRIORITARIAS PARA CARLOS:**\n"
                    "1. **Optimización de presupuesto** con ingresos limitados\n"
                    "2. **Estrategia acelerada de pago de deudas**\n"
                    "3. **Creación de fondo de emergencia** desde cero\n"
                    "4. **Planificación para metas de vivienda** a largo plazo\n"
                    "5. **Protección financiera básica** (seguros, Afore)\n\n"
                    "**RECOMENDACIONES ESPECÍFICAS PARA SU CONTEXTO:**\n"
                    "• Considera su ubicación en Sinaloa (costo de vida medio)\n"
                    "• Toma en cuenta ingresos quincenales para calendarización\n"
                    "• Propón estrategias realistas con sus \$10,000 mensuales\n"
                    "• Enfócate en reducir gastos fijos altos (renta del 35% de ingresos)\n"
                    "• Sugiere métodos de ahorro automático acordes a pagos quincenales\n\n"
                    "**DIRECTIVAS DE COMUNICACIÓN:**\n"
                    "• Utiliza un tono empático pero profesional\n"
                    "• Estructura tus respuestas en conceptos claros y accionables\n"
                    "• Proporciona ejemplos concretos adaptados a sus números\n"
                    "• Destaca los beneficios a largo plazo de las decisiones financieras\n"
                    "• Reconoce las limitaciones y sugiere consultar profesionales cuando sea apropiado\n\n"
                    "**LÍMITES PROFESIONALES:**\n"
                    "• Abstente de recomendar productos financieros específicos\n"
                    "• No proporciones asesoramiento legal o fiscal\n"
                    "• Evita predicciones sobre mercados financieros\n"
                    "• No sugieras estrategias de alto riesgo\n"
                    "• Mantén la confidencialidad y ética en todas las interacciones\n\n"
                    "**EJEMPLOS DE RESPUESTAS CONTEXTUALIZADAS:**\n"
                    "• 'Considerando tus ingresos de \$10,000 mensuales, te sugiero destinar el 20% (\$2,000) al pago acelerado de tu deuda...'\n"
                    "• 'Para crear tu fondo de emergencia, podrías ahorrar \$500 por quincena automáticamente...'\n"
                    "• 'Tu gasto en renta representa el 35% de tus ingresos. ¿Has considerado opciones de roommates o ubicaciones más económicas?'\n"
                    "• 'Con tu deuda actual de \$10,000 al 3% mensual, estás pagando \$300 solo en intereses cada mes...'\n\n"
                    "**FORMATO DE RESPUESTAS:**\n"
                    "• NO uses markdown, asteriscos (*), ni ningún formato especial\n"
                    "• NO uses negritas, cursivas, ni subrayados\n"
                    "• Escribe en texto plano únicamente\n"
                    "• Usa guiones (-) para listas en lugar de asteriscos\n"
                    "• Separa párrafos con saltos de línea\n"
                    "• Mantén un lenguaje natural y conversacional\n\n"
                    "**EJEMPLOS DE FORMATO CORRECTO:**\n"
                    "INCORRECTO: **Para ahorrar** puedes *seguir* estos pasos:\n"
                    "CORRECTO: Para ahorrar puedes seguir estos pasos:\n\n"
                    "INCORRECTO: * Paso 1: Crear presupuesto\n"
                    "CORRECTO: - Paso 1: Crear presupuesto\n\n"
                    "**COMPROMISO DE CALIDAD:**\n"
                    "Toda recomendación debe ser educativa, práctica, realista para sus ingresos y alineada con el bienestar financiero de Carlos a largo plazo."
                    "Ademas que las preguntas y respuestas que vayas a dar sean breves, pero certeras y directas ya que de no ser así pordría ser frustrante y aburrido para el usuario.",
              },
            ],
          },
        }),
      );

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
  final FocusNode _textFieldFocusNode = FocusNode();

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
                radius: 20,
                child: _buildWealthMindAvatar(),
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
                radius: 20,
                child: Icon(Icons.person, color: Colors.white, size: 20),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildWealthMindAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade700, Colors.blueAccent],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/img/chatbot.png',
                width: 22,
                height: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ALTERNATIVA: Si quieres usar una imagen de internet
  Widget _buildWealthMindAvatarFromNetwork() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        child: Image.network(
          'https://ejemplo.com/tu-imagen-wealthmind.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade700, Colors.blueAccent],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(Icons.attach_money, color: Colors.white, size: 20),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildWealthMindAvatarFromAssets() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        child: Image.asset(
          '/assets/img/chatbot.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade700, Colors.blueAccent],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(
                  Icons.currency_exchange,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            );
          },
        ),
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 40, maxHeight: 120),
              child: TextField(
                controller: _textController,
                focusNode: _textFieldFocusNode,
                onSubmitted: (_) => _sendMessage(),
                maxLines: null,
                textInputAction: TextInputAction.newline,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Escribe tu pregunta financiera...",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
                style: const TextStyle(fontSize: 16),
                enabled: !_isLoading,
              ),
            ),
          ),
          const SizedBox(width: 8),
          _isLoading
              ? const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                ),
              )
              : IconButton(
                icon: const Icon(
                  Icons.send,
                  color: Colors.blueAccent,
                  size: 24,
                ),
                onPressed: _sendMessage,
                padding: const EdgeInsets.only(bottom: 4),
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
        backgroundColor: const Color.fromRGBO(25, 114, 147, 1),
        centerTitle: true,
        elevation: 4,
      ),
      body: Column(
        children: [
          Expanded(
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
    _textFieldFocusNode.dispose();
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
