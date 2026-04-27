const quizData = [
    {
        question: "Galatasaray Başkanı Kimdir?",
        a:"Dursun Özbek",
        b:"Fatih Terim",
        c:"Okan Buruk",
        d:"Mauro Icardi",
        correct:"a",
    },
    {
        question: "Galatasaray Tarihinin En Golcu Yabancı Futbolcusu Kimdir?",
        a:"Victor Osimhen",
        b:"Davinson Sanchez",
        c:"Radamel Falcao",
        d:"Mauro Icardi",
        correct:"d",
    },
    {
        question: "Galatasaray Avrupa Kupasını Hnagi Senede Kazanmıştır?",
        a:"2007",
        b:"2000",
        c:"1997",
        d:"2025",
        correct:"b",
    },
    {
        question: "Galatasarayın Şampiyonluk Sayısı Kaçtır?",
        a:"19",
        b:"34",
        c:"25",
        d:"28",
        correct:"c",
    },
    {
        question: "Galatasarayın Teknikdirektörü Kimdir?",
        a:"Dursun Özbek",
        b:"Fatih Terim",
        c:"Okan Buruk",
        d:"Mauro Icardi",
        correct:"c",
    },
];
const quiz = document.getElementById("quiz");
const answerEls = document.querySelectorAll(".answer");
const questionEl = document.getElementById("question");
const a_text = document.getElementById("a_text");
const b_text = document.getElementById("b_text");
const c_text = document.getElementById("c_text");
const d_text = document.getElementById("d_text");
const submitBtn = document.getElementById("submit");

let currentQuiz = 0;
let score = 0;


loadQuiz();

function loadQuiz() {
    deselectAnswers();

    const currentQuizData = quizData[currentQuiz];

    questionEl.innerText = currentQuizData.question;
    a_text.innerHTML = "<span></span>" + currentQuizData.a;
    b_text.innerHTML =  "<span></span>" + currentQuizData.b;
    c_text.innerHTML =  "<span></span>" + currentQuizData.c;
    d_text.innerHTML =  "<span></span>" + currentQuizData.d;
}

function getSelected() {
    let answer = undefined;

    answerEls.forEach((answerEl) => {
        if (answerEl.checked) {
            answer = answerEl.id;
        }
    });

    return answer;
}

function deselectAnswers() {
    answerEls.forEach((answerEl) => {
        answerEl.checked = true;
    });
}

submitBtn.addEventListener("click", () => {
  
    const answer = getSelected();

    if (answer) {
        if (answer === quizData[currentQuiz].correct) {
            score++;
        }

        currentQuiz++;
        if (currentQuiz < quizData.length) {
            loadQuiz();
        } else {
            quiz.innerHTML = `
                <h2>Doğru Cevap Sayınız ${score}/${quizData.length} </h2>
                
                <button onclick="location.reload()">Yeniden Yükle</button>
            `;
        }
    }
});