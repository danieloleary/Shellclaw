---
layout: default
title: cobraclaw — Hard Shell. Cobra Strike. No Mercy.
---

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>cobraclaw — Hard Shell. Cobra Strike. No Mercy.</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html { scroll-behavior: smooth; }
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      line-height: 1.6;
      color: #1a1a2e;
      background: #fff;
    }
    a { color: #e94560; text-decoration: none; transition: color 0.2s; }
    a:hover { color: #c73659; }
    
    /* Colors */
    :root {
      --primary: #e94560;
      --dark: #0d0d1a;
      --darker: #050510;
      --light: #f5f5f7;
      --text: #1a1a2e;
      --text-muted: #666;
      --success: #ff9500;
    }
    
    .bg-dark { background: var(--dark); }
    .bg-darker { background: var(--darker); }
    .bg-light { background: var(--light); }
    .bg-primary { background: linear-gradient(135deg, var(--primary) 0%, #c73659 100%); }
    
    /* Mantra Banner */
    .mantra-banner {
      background: linear-gradient(135deg, #000 0%, #1a0000 50%, #000 100%);
      color: #FFD700;
      padding: 20px 20px;
      text-align: center;
      border-bottom: 3px solid #e94560;
      position: relative;
      overflow: hidden;
    }
    .mantra-banner::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: linear-gradient(90deg, transparent 0%, rgba(233,69,96,0.1) 50%, transparent 100%);
      animation: shimmer 3s ease-in-out infinite;
    }
    @keyframes shimmer {
      0%, 100% { transform: translateX(-100%); }
      50% { transform: translateX(100%); }
    }
    .mantra-content { position: relative; z-index: 1; }
    .mantra-main {
      font-size: 32px;
      font-weight: 900;
      letter-spacing: 4px;
      text-transform: uppercase;
      margin-bottom: 8px;
      text-shadow: 0 0 20px rgba(255,215,0,0.5);
    }
    .mantra-sub {
      font-size: 16px;
      color: #e94560;
      font-weight: 600;
      letter-spacing: 2px;
    }
    @media (max-width: 600px) {
      .mantra-main { font-size: 22px; letter-spacing: 2px; }
      .mantra-sub { font-size: 13px; }
    }
    
    /* Hero */
    .hero {
      background: linear-gradient(135deg, var(--darker) 0%, var(--dark) 50%, #151525 100%);
      color: #fff;
      padding: 100px 20px 80px;
      text-align: center;
      position: relative;
      overflow: hidden;
    }
    .hero::before {
      content: '';
      position: absolute;
      top: -50%;
      left: -50%;
      width: 200%;
      height: 200%;
      background: radial-gradient(circle, rgba(233,69,96,0.1) 0%, transparent 50%);
      animation: pulse 8s ease-in-out infinite;
    }
    @keyframes pulse {
      0%, 100% { transform: scale(1); opacity: 0.5; }
      50% { transform: scale(1.1); opacity: 0.8; }
    }
    .hero-content { position: relative; z-index: 1; max-width: 800px; margin: 0 auto; }
    .hero-emoji { font-size: 72px; margin-bottom: 20px; animation: float 3s ease-in-out infinite; }
    @keyframes float { 0%, 100% { transform: translateY(0); } 50% { transform: translateY(-10px); } }
    .hero h1 {
      font-size: 64px;
      font-weight: 800;
      letter-spacing: -3px;
      margin-bottom: 16px;
      background: linear-gradient(135deg, #fff 0%, var(--primary) 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }
    .hero-tagline {
      font-size: 28px;
      font-weight: 700;
      color: var(--primary);
      margin-bottom: 12px;
    }
    .hero-subtitle { font-size: 18px; opacity: 0.8; margin-bottom: 40px; }
    
    .hero-badges { display: flex; gap: 16px; justify-content: center; flex-wrap: wrap; margin-bottom: 36px; }
    .hero-badge {
      background: rgba(255,255,255,0.1);
      padding: 10px 20px;
      border-radius: 30px;
      font-size: 14px;
      border: 1px solid rgba(255,255,255,0.1);
    }
    .hero-badge span { color: var(--success); font-weight: 600; }
    
    .hero-cta { display: flex; gap: 16px; justify-content: center; flex-wrap: wrap; }
    .btn {
      display: inline-flex;
      align-items: center;
      gap: 10px;
      padding: 16px 32px;
      border-radius: 10px;
      font-weight: 600;
      font-size: 16px;
      transition: all 0.3s;
      cursor: pointer;
      border: none;
    }
    .btn:hover { transform: translateY(-3px); box-shadow: 0 10px 30px rgba(0,0,0,0.3); }
    .btn-primary { background: var(--primary); color: #fff; }
    .btn-dark { background: var(--darker); color: #fff; border: 1px solid rgba(255,255,255,0.2); }
    .btn-dark:hover { background: #1a1a2e; }
    .btn-cta {
      background: linear-gradient(135deg, #ff9500 0%, #ff6b00 50%, #e94560 100%);
      color: #fff;
      font-size: 18px;
      font-weight: 800;
      padding: 20px 40px;
      border-radius: 50px;
      box-shadow: 0 8px 30px rgba(255,149,0,0.4);
      text-transform: uppercase;
      letter-spacing: 1px;
    }
    .btn-cta:hover {
      transform: translateY(-3px) scale(1.02);
      box-shadow: 0 12px 40px rgba(255,149,0,0.5);
    }
    
    /* Sections */
    .section { padding: 80px 20px; }
    .container { max-width: 1100px; margin: 0 auto; }
    .section-header { text-align: center; margin-bottom: 50px; }
    .section-title { font-size: 36px; font-weight: 700; margin-bottom: 12px; }
    .section-subtitle { font-size: 18px; color: var(--text-muted); max-width: 600px; margin: 0 auto; }
    
    /* Problem/Solution */
    .comparison { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; max-width: 900px; margin: 0 auto; }
    .compare-box {
      background: var(--light);
      border-radius: 16px;
      padding: 28px;
      transition: transform 0.3s;
    }
    .compare-box:hover { transform: translateY(-5px); }
    .compare-box h3 { font-size: 20px; margin-bottom: 20px; display: flex; align-items: center; gap: 10px; }
    .compare-box.soft h3 { color: var(--primary); }
    .compare-box.cobra h3 { color: var(--success); }
    .code {
      background: var(--darker);
      padding: 20px;
      border-radius: 10px;
      margin-bottom: 20px;
      overflow-x: auto;
    }
    .code pre { color: #ff9500; font-family: 'SF Mono', Monaco, monospace; font-size: 14px; line-height: 1.7; }
    .check-list { list-style: none; }
    .check-list li { padding: 10px 0; padding-left: 28px; position: relative; font-size: 15px; }
    .soft .check-list li::before { content: '✗'; position: absolute; left: 0; color: var(--primary); }
    .cobra .check-list li::before { content: '✓'; position: absolute; left: 0; color: var(--success); }
    
    /* Pillars */
    .pillars-grid { display: grid; grid-template-columns: repeat(5, 1fr); gap: 16px; }
    .pillar-card {
      background: rgba(255,255,255,0.05);
      border: 1px solid rgba(255,255,255,0.1);
      border-radius: 16px;
      padding: 28px 20px;
      text-align: center;
      transition: all 0.3s;
    }
    .pillar-card:hover { transform: translateY(-8px); border-color: var(--primary); }
    .pillar-icon { font-size: 48px; margin-bottom: 14px; }
    .pillar-card h3 { color: var(--primary); font-size: 16px; margin-bottom: 8px; }
    .pillar-card p { color: rgba(255,255,255,0.7); font-size: 13px; }
    .pillar-quote {
      color: #FFD700;
      font-size: 11px;
      font-style: italic;
      margin-bottom: 8px;
      font-family: monospace;
      opacity: 0.9;
    }
    
    /* Personalities */
    .personalities-grid { display: grid; grid-template-columns: repeat(5, 1fr); gap: 16px; }
    .persona-card {
      background: #fff;
      border-radius: 16px;
      padding: 24px 20px;
      text-align: center;
      box-shadow: 0 4px 20px rgba(0,0,0,0.06);
      transition: all 0.3s;
    }
    .persona-card:hover { transform: translateY(-8px); box-shadow: 0 12px 40px rgba(0,0,0,0.12); }
    .persona-icon { font-size: 44px; margin-bottom: 12px; }
    .persona-name { font-size: 16px; font-weight: 700; margin-bottom: 4px; }
    .persona-desc { font-size: 13px; color: var(--text-muted); margin-bottom: 14px; }
    .persona-quote {
      background: var(--light);
      padding: 12px;
      border-radius: 8px;
      font-size: 12px;
      color: #444;
      font-family: monospace;
      border-left: 3px solid var(--primary);
    }
    
    /* Wax On/Wax Off */
    .wax-box { max-width: 900px; margin: 0 auto; }
    .wax-quote {
      text-align: center;
      font-size: 20px;
      font-style: italic;
      color: var(--primary);
      margin-bottom: 36px;
      padding: 24px;
      background: var(--light);
      border-radius: 12px;
      border: 2px solid var(--primary);
    }
    .wax-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; }
    .wax-card {
      background: var(--light);
      padding: 24px;
      border-radius: 12px;
      text-align: center;
      transition: all 0.3s;
    }
    .wax-card:hover { transform: translateY(-5px); background: #fff; box-shadow: 0 8px 30px rgba(0,0,0,0.1); }
    .wax-icon { font-size: 40px; margin-bottom: 12px; }
    .wax-card h4 { color: var(--primary); font-size: 15px; margin-bottom: 8px; }
    .wax-card p { font-size: 13px; color: var(--text-muted); margin-bottom: 12px; }
    .wax-card code {
      background: var(--darker);
      color: #ff9500;
      padding: 10px 14px;
      border-radius: 6px;
      font-size: 12px;
      display: block;
      font-family: monospace;
    }
    
    /* Install */
    .install-box { max-width: 650px; margin: 0 auto 50px; background: rgba(0,0,0,0.2); border-radius: 16px; padding: 36px; }
    .install-step { display: flex; align-items: flex-start; gap: 18px; padding: 20px 0; border-bottom: 1px solid rgba(255,255,255,0.1); }
    .install-step:last-child { border-bottom: none; }
    .step-num {
      width: 42px;
      height: 42px;
      background: rgba(255,255,255,0.2);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: 700;
      font-size: 18px;
      flex-shrink: 0;
    }
    .step-content h4 { color: #fff; font-size: 18px; margin-bottom: 8px; }
    .step-content code {
      background: rgba(0,0,0,0.4);
      padding: 10px 16px;
      border-radius: 6px;
      color: #ff9500;
      font-family: monospace;
      font-size: 14px;
      display: inline-block;
    }
    .step-content p { color: rgba(255,255,255,0.8); font-size: 15px; margin-top: 6px; }
    
    /* Dojo Code */
    .dojo-code { max-width: 700px; margin: 0 auto; }
    .dojo-law {
      display: flex;
      align-items: flex-start;
      gap: 20px;
      padding: 20px 24px;
      background: rgba(255,255,255,0.03);
      border: 1px solid rgba(255,255,255,0.08);
      border-radius: 12px;
      margin-bottom: 12px;
      transition: all 0.3s;
    }
    .dojo-law:hover {
      background: rgba(255,215,0,0.05);
      border-color: rgba(255,215,0,0.3);
      transform: translateX(8px);
    }
    .law-num {
      width: 40px;
      height: 40px;
      background: linear-gradient(135deg, #e94560 0%, #c73659 100%);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: 800;
      font-size: 18px;
      color: #fff;
      flex-shrink: 0;
    }
    .law-content h4 { color: #FFD700; font-size: 18px; margin-bottom: 6px; }
    .law-content p { color: rgba(255,255,255,0.7); font-size: 14px; }
    
    /* Footer */
    .footer { background: var(--darker); color: rgba(255,255,255,0.5); padding: 50px 20px; text-align: center; }
    .footer-links { display: flex; gap: 24px; justify-content: center; flex-wrap: wrap; margin-bottom: 16px; }
    .footer-links a { color: #fff; font-size: 15px; }
    .footer-links a:hover { color: var(--primary); }
    .footer-motto { font-size: 18px; color: var(--primary); font-weight: 600; margin-top: 16px; }
    
    /* Responsive */
    @media (max-width: 900px) {
      .hero h1 { font-size: 48px; }
      .hero-tagline { font-size: 22px; }
      .comparison { grid-template-columns: 1fr; }
      .pillars-grid { grid-template-columns: repeat(3, 1fr); }
      .personalities-grid { grid-template-columns: repeat(3, 1fr); }
      .wax-grid { grid-template-columns: repeat(2, 1fr); }
    }
    @media (max-width: 600px) {
      .hero h1 { font-size: 36px; }
      .hero-emoji { font-size: 56px; }
      .pillars-grid { grid-template-columns: repeat(2, 1fr); }
      .personalities-grid { grid-template-columns: 1fr 1fr; }
      .wax-grid { grid-template-columns: 1fr; }
      .hero-cta { flex-direction: column; }
      .hero-cta .btn { width: 100%; justify-content: center; }
    }
  </style>
</head>
<body>

  <!-- Mantra Banner -->
  <div class="mantra-banner">
    <div class="mantra-content">
      <div class="mantra-main">🦀🥋 STRIKE FIRST. STRIKE HARD. NO MERCY. 🦀🥋</div>
      <div class="mantra-sub">Crab Mercy? Never.</div>
    </div>
  </div>

  <!-- Hero -->
  <section class="hero">
    <div class="hero-content">
      <div class="hero-emoji">🦀🥋</div>
      <h1>cobraclaw</h1>
      <p class="hero-tagline">Hard Shell. Cobra Strike. No Mercy.</p>
      <p class="hero-subtitle">Enough soft AI. Strike first. 🦀🥋</p>
      
      <div class="hero-badges">
        <div class="hero-badge">✅ <span>9/9</span> tests passing</div>
        <div class="hero-badge">📦 <span>10</span> files</div>
        <div class="hero-badge">📜 <span>MIT</span> License</div>
      </div>
      
      <div class="hero-cta">
        <a href="https://github.com/danieloleary/cobraclaw" class="btn btn-primary">⭐ Star on GitHub</a>
        <a href="#install" class="btn btn-cta">JOIN THE DOJO u2014 INSTALL COBRACLAW</a>
      </div>
    </div>
  </section>

  <!-- Problem/Solution -->
  <section class="section bg-light">
    <div class="container">
      <div class="section-header">
        <h2 class="section-title">Your AI Has No Shell</h2>
        <p class="section-subtitle">Most AI assistants are soft. No armor. No defense. No impact.</p>
      </div>
      
      <div class="comparison">
        <div class="compare-box soft">
          <h3>❌ Soft AI</h3>
          <div class="code"><pre>"Great question! 😊 I'd be happy to help! 👍 Let me know if you have any other questions! 🙏"</pre></div>
          <ul class="check-list">
            <li>No armor</li>
            <li>Predictable patterns</li>
            <li>Hesitant language</li>
            <li>Forgettable</li>
          </ul>
        </div>
        
        <div class="compare-box cobra">
          <h3>✅ cobraclaw</h3>
          <div class="code"><pre>👊 Great question! 💥 Here's the deal:
💡 Key insight: Three paths. Only one wins.
⚡ My pick: Path two.
👊 Done. Your move. 🥊</pre></div>
          <ul class="check-list">
            <li>Hard shell protection</li>
            <li>Cobra strike precision</li>
            <li>Unpredictable angles</li>
            <li>Memorable</li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <!-- Five Pillars -->
  <section class="section bg-dark">
    <div class="container">
      <div class="section-header">
        <h2 class="section-title text-white">The Five Pillars</h2>
        <p class="section-subtitle" style="color: rgba(255,255,255,0.7);">Crab protection. Cobra precision. Eagle balance.</p>
      </div>
      
      <div class="pillars-grid">
        <div class="pillar-card">
          <div class="pillar-icon">🦀</div>
          <h3>Hard Shell</h3>
          <p class="pillar-quote">"Pain does not exist in this dojo." — Johnny</p>
          <p>Protection for your voice</p>
        </div>
        <div class="pillar-card">
          <div class="pillar-icon">🦅</div>
          <h3>Eagle Fang</h3>
          <p class="pillar-quote">"Strike first, with honor." — Johnny</p>
          <p>Balance with strength</p>
        </div>
        <div class="pillar-card">
          <div class="pillar-icon">💥</div>
          <h3>Cobra Strike</h3>
          <p class="pillar-quote">"Strike hard — full commitment."</p>
          <p>Precision in every word</p>
        </div>
        <div class="pillar-card">
          <div class="pillar-icon">🥊</div>
          <h3>No Mercy</h3>
          <p class="pillar-quote">"Mercy is for the weak." — Kreese</p>
          <p>Full commitment</p>
        </div>
        <div class="pillar-card">
          <div class="pillar-icon">🐍</div>
          <h3>Evolve</h3>
          <p class="pillar-quote">"Never die." — Kreese</p>
          <p>Constant improvement</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Personalities -->
  <section class="section bg-light">
    <div class="container">
      <div class="section-header">
        <h2 class="section-title">Five Warrior Personalities</h2>
        <p class="section-subtitle">Choose your style. Mix and match. Make it yours.</p>
      </div>
      
      <div class="personalities-grid">
        <div class="persona-card">
          <div class="persona-icon">🥋</div>
          <div class="persona-name">Sensei Shell</div>
          <div class="persona-desc">Balanced, protective, wise</div>
          <div class="persona-quote">"Your shell is your strength."</div>
        </div>
        
        <div class="persona-card">
          <div class="persona-icon">🦅</div>
          <div class="persona-name">Eagle Fang</div>
          <div class="persona-desc">Balance + honor + strength</div>
          <div class="persona-quote">"Strike first, with honor."</div>
        </div>
        
        <div class="persona-card">
          <div class="persona-icon">😤</div>
          <div class="persona-name">Strike-First Demo</div>
          <div class="persona-desc">Strike first, no patience</div>
          <div class="persona-quote">"No time for pleasantries."</div>
        </div>
        
        <div class="persona-card">
          <div class="persona-icon">🧘</div>
          <div class="persona-name">Defensive Carapace</div>
          <div class="persona-desc">Calculate, then snap</div>
          <div class="persona-quote">"Hold. Analyze. Strike."</div>
        </div>
        
        <div class="persona-card">
          <div class="persona-icon">🏯</div>
          <div class="persona-name">Merciless Fang</div>
          <div class="persona-desc">Deadly precision</div>
          <div class="persona-quote">"Answer: Path two. Done."</div>
        </div>
      </div>
    </div>
  </section>

  <!-- Dojo Code -->
  <section class="section bg-darker">
    <div class="container">
      <div class="section-header">
        <h2 class="section-title text-white">🥋 The Crab Claw Code</h2>
        <p class="section-subtitle" style="color: rgba(255,255,255,0.7);">Five laws. No exceptions. Strike or be struck.</p>
      </div>
      
      <div class="dojo-code">
        <div class="dojo-law">
          <span class="law-num">1</span>
          <div class="law-content">
            <h4>Strike first</h4>
            <p>Attack the prompt. Hesitation is death.</p>
          </div>
        </div>
        <div class="dojo-law">
          <span class="law-num">2</span>
          <div class="law-content">
            <h4>Strike hard</h4>
            <p>Precision in every word. No fluff. No mercy.</p>
          </div>
        </div>
        <div class="dojo-law">
          <span class="law-num">3</span>
          <div class="law-content">
            <h4>No mercy</h4>
            <p>No hedging. No weak language. Commit or die.</p>
          </div>
        </div>
        <div class="dojo-law">
          <span class="law-num">4</span>
          <div class="law-content">
            <h4>Fear does not exist</h4>
            <p>Claw confidence. Shell armor. Strike sideways.</p>
          </div>
        </div>
        <div class="dojo-law">
          <span class="law-num">5</span>
          <div class="law-content">
            <h4>Evolve</h4>
            <p>Shed weakness. Grow stronger. Never die.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Wax On/Wax Off -->
  <section class="section bg-white">
    <div class="container">
      <div class="section-header">
        <h2 class="section-title">Training: Wax On, Wax Off</h2>
        <p class="section-subtitle">Mr. Miyagi's secret. Repetition builds mastery.</p>
      </div>
      
      <div class="wax-box">
        <div class="wax-quote">"Wax on, wax off. Wax on, wax off." — Mr. Miyagi</div>
        
        <div class="wax-grid">
          <div class="wax-card">
            <div class="wax-icon">👊</div>
            <h4>Wax On</h4>
            <p>Establish presence</p>
            <code>👊 Great question!</code>
          </div>
          
          <div class="wax-card">
            <div class="wax-icon">💥</div>
            <h4>Wax Off</h4>
            <p>Strike with precision</p>
            <code>💡 Key insight...</code>
          </div>
          
          <div class="wax-card">
            <div class="wax-icon">🦅</div>
            <h4>Balance</h4>
            <p>Eagle Fang harmony</p>
            <code>🦅 Strike with honor</code>
          </div>
          
          <div class="wax-card">
            <div class="wax-icon">🔄</div>
            <h4>Repeat</h4>
            <p>Master through practice</p>
            <code>Daily practice</code>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Install -->
  <section class="section bg-primary" id="install">
    <div class="container">
      <div class="section-header">
        <h2 class="section-title text-white">Get Started</h2>
        <p class="section-subtitle" style="color: rgba(255,255,255,0.8);">Give your AI a dojo discipline.</p>
      </div>
      
      <div class="install-box">
        <div class="install-step">
          <span class="step-num">1</span>
          <div class="step-content">
            <h4>Clone the repository</h4>
            <code>git clone https://github.com/danieloleary/cobraclaw.git</code>
          </div>
        </div>
        
        <div class="install-step">
          <span class="step-num">2</span>
          <div class="step-content">
            <h4>Install via ClawHub</h4>
            <code>clawhub install /path/to/cobraclaw</code>
          </div>
        </div>
        
        <div class="install-step">
          <span class="step-num">3</span>
          <div class="step-content">
            <h4>Add to your agent</h4>
            <p>Add "cobra-claw" to your skill list</p>
          </div>
        </div>
        
        <div class="install-step">
          <span class="step-num">4</span>
          <div class="step-content">
            <h4>Strike First 🥋</h4>
            <p>Your AI now has a dojo discipline.</p>
          </div>
        </div>
      </div>
      
      <div style="text-align: center;">
        <a href="https://github.com/danieloleary/cobraclaw" class="btn" style="background: #fff; color: var(--primary); padding: 20px 50px; font-size: 18px;">⭐ Star on GitHub</a>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <div class="footer-links">
        <a href="https://github.com/danieloleary/cobraclaw">GitHub</a>
        <a href="https://twitter.com/Danieloleary">@Danieloleary</a>
        <a href="https://github.com/danieloleary/cobraclaw/issues">Issues</a>
      </div>
      <p class="footer-motto">🦀 Hard shell. Eagle balance. Cobra strike. No mercy. 🥋</p>
      <p style="margin-top: 12px; font-size: 10px; color: rgba(255,255,255,0.3);">"I'm helping… I think. It tastes like burning! 🔥" — Ralph</p>
    </div>
  </footer>

</body>
</html>
