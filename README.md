# when2jam

> The minimalist way to find a time to jam.

A lightweight, real-time availability scheduler built for musicians, teams, and friends who want to find common free time without the friction of complex calendar apps.

**[Live Demo](https://when2jam.vercel.app)** | **[GitHub](https://github.com/kapilcdave/when2jam)**

---

## ✨ Why when2jam?

- **No Sign-Ups**: Share a link, start collaborating instantly
- **Lightning Fast**: Minimal UI, maximum speed
- **Mobile Native**: Built for thumb-friendly interactions
- **Real-Time Sync**: See everyone's availability update live
- **Visual Heatmap**: Green shading shows group availability at a glance
- **Privacy Focused**: No tracking, no databases storing personal data beyond the event

---

## 🎯 How It Works

1. **Create an Event**: Pick your time range (up to 7 days) and event name
2. **Mark Your Time**: Click & drag across time slots to mark when you're available
3. **Share the Link**: One-click copy to clipboard—no registration needed
4. **See Results**: Watch in real-time as others mark their availability
5. **Find the Sweet Spot**: Green-shaded cells show when the group is most available

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | Next.js 14 (App Router) + React 18 |
| **Styling** | Tailwind CSS |
| **Database** | Supabase (PostgreSQL) |
| **Real-Time** | Supabase Realtime |
| **Deployment** | Vercel |

---

## 🚀 Getting Started

### Prerequisites
- Node.js 18+
- npm or yarn
- Supabase account (free tier works great)

### Local Development

1. **Clone the repo**
   ```bash
   git clone https://github.com/kapilcdave/when2jam.git
   cd when2jam
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   Create a `.env.local` file in the project root:
   ```env
   NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

4. **Run the development server**
   ```bash
   npm run dev
   ```
   Open [http://localhost:3000](http://localhost:3000) in your browser.

---

## 📦 Building for Production

```bash
npm run build
npm start
```

Or deploy directly to Vercel:
```bash
npm install -g vercel
vercel
```

---

## 🗂️ Project Structure

```
when2jam/
├── app/
│   ├── page.tsx          # Main scheduling UI
│   ├── layout.tsx        # Root layout
│   └── globals.css       # Global styles
├── lib/
│   └── supabase.ts       # Supabase client
├── public/               # Static assets
├── package.json
├── tsconfig.json
└── tailwind.config.ts
```

---

## 🎨 Design Philosophy

- **Minimalist**: Remove friction, keep focus on finding time
- **Accessible**: High contrast, keyboard & touch friendly
- **Fast**: Instant interactions, no loading spinners where possible
- **Mobile-First**: 30-minute time slots are tap-friendly

---

## 🤝 Contributing

Found a bug or have an idea? Contributions are welcome!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📝 License

This project is open source and available under the MIT License.

---

## 👨‍💻 Made with ♥ by [Kapil](https://github.com/kapilcdave)

Have feedback or questions? [Open an issue](https://github.com/kapilcdave/when2jam/issues) or reach out on [Twitter](https://twitter.com/kapilcdave).
