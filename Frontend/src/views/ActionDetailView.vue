<template>
  <section class="py-20 bg-gradient-to-br from-gray-50 via-white to-gray-100 text-gray-800">
    <div class="container mx-auto px-6 lg:px-12 max-w-6xl">
      <div class="text-center mb-12">
        <h1 class="text-4xl md:text-5xl font-extrabold text-blue-700 mb-4 animate-fadeInSoft">
          {{ programData.title }}
        </h1>
        <p class="text-lg md:text-xl text-gray-600 max-w-3xl mx-auto animate-fadeInSoft delay-150">
          {{ programData.description }}
        </p>
      </div>

      <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-8">
        <div
          v-for="subject in programData.subjects"
          :key="subject.name"
          class="group bg-white rounded-2xl shadow-md hover:shadow-xl p-6 transition-all duration-300 transform hover:-translate-y-1 animate-fadeInSoft delay-300 cursor-pointer"
          @click="goToSubjectDetail(subject.name)"
        >
          <div class="flex items-center justify-center w-14 h-14 bg-orange-100 text-orange-500 rounded-full mb-4 shadow">
            <Icon :icon="subject.icon" class="w-6 h-6" />
          </div>
          <h3 class="text-xl font-semibold text-gray-800 mb-2">{{ subject.name }}</h3>
          <p class="text-gray-600">{{ subject.description }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const express = require('express')
const nodemailer = require('nodemailer')
const cors = require('cors')
const bodyParser = require('body-parser')

const app = express()
app.use(cors())
app.use(bodyParser.json())

app.post('/send-donation', async (req, res) => {
  const { name, email, amount, message } = req.body

  const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: 'chobunny22@gmail.com', // <-- Change this to your Gmail
      pass: 'wvpv gmnq mkcd fqbm'    // <-- Generate from Google App Passwords
    }
  })

  const mailOptions = {
    from: email,
    to: 'chobunny22@gmail.com',
    subject: 'New Donation Received',
    html: `
      <h2>🎉 New Donation Submission</h2>
      <p><strong>Name:</strong> ${name}</p>
      <p><strong>Email:</strong> ${email}</p>
      <p><strong>Amount:</strong> $${amount}</p>
      <p><strong>Message:</strong> ${message || '(none)'}</p>
    `
  }

  try {
    await transporter.sendMail(mailOptions)
    res.status(200).send('Email sent')
  } catch (error) {
    console.error('Error sending email:', error)
    res.status(500).send('Error sending email')
  }
})

app.listen(3000, () => {
  console.log('✅ Server running at http://localhost:3000')
})

</script>

<style scoped>
@keyframes fadeInSoft {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
.animate-fadeInSoft {
  animation: fadeInSoft 0.5s ease-out both;
}
.delay-150 {
  animation-delay: 0.15s;
}
.delay-300 {
  animation-delay: 0.3s;
}
</style>
