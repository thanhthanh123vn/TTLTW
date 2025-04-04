// Hàm gửi yêu cầu đến ChatGPT API
async function sendMessageToChatGPT(message) {
    const apiKey = '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';  // Thay thế bằng API key của bạn
    const apiUrl = 'https://api.openai.com/v1/chat/completions';

    const headers = {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${apiKey}`
    };

    const body = JSON.stringify({
        model: 'gpt-3.5-turbo', // Hoặc gpt-4 nếu bạn sử dụng phiên bản GPT-4
        messages: [
            { role: 'system', content: 'Bạn là một trợ lý ảo hữu ích.' },
            { role: 'user', content: message }
        ]
    });

    try {
        const response = await fetch(apiUrl, {
            method: 'POST',
            headers: headers,
            body: body
        });

        const data = await response.json();
        return data.choices[0].message.content; // Lấy kết quả trả về
    } catch (error) {
        console.error('Error:', error);
        return 'Đã xảy ra lỗi khi gửi yêu cầu';
    }
}

// Ví dụ: Gửi câu hỏi tới ChatGPT và nhận phản hồi
sendMessageToChatGPT('Chào, ChatGPT!').then(response => {
    console.log(response);
});
function toggleChat() {
    var chatBox = document.getElementById("chatBox");
    if (chatBox.style.display === "none" || chatBox.style.display === "") {
        chatBox.style.display = "block";
    } else {
        chatBox.style.display = "none";
    }
}

async function sendChatMessage() {
    const inputField = document.getElementById("chatInput");
    const message = inputField.value;
    if (message.trim() === '') return; // Nếu không có tin nhắn, bỏ qua

    // Hiển thị tin nhắn của người dùng
    displayMessage('Bạn: ' + message);

    // Gửi tin nhắn đến ChatGPT và nhận phản hồi
    const response = await sendMessageToChatGPT(message);

    // Hiển thị phản hồi từ ChatGPT
    displayMessage('ChatGPT: ' + response);

    // Xóa ô input
    inputField.value = '';
}

function displayMessage(message) {
    const chatMessages = document.getElementById("chatMessages");
    const messageDiv = document.createElement("div");
    messageDiv.textContent = message;
    chatMessages.appendChild(messageDiv);
    chatMessages.scrollTop = chatMessages.scrollHeight; // Cuộn xuống dưới cùng
}

