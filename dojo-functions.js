// 🥋 COBRACLAW DOJO FUNCTIONS
// Core functions for the dojo training system

/**
 * Bow in to the dojo - Start of training session
 */
function bowIn() {
  console.log("🥋 Bowing in to the dojo...");
  console.log("👊 STRIKE FIRST. STRIKE HARD. NO MERCY. 👊");
  return {
    timestamp: new Date().toISOString(),
    status: "ready",
    spirit: "ferocious"
  };
}

/**
 * Sweep the leg - Execute a technique with precision
 */
function sweepTheLeg(technique, target) {
  console.log(`🦿 Sweeping the leg with: ${technique}`);
  console.log(`🎯 Target: ${target}`);
  
  return {
    technique,
    target,
    executed: true,
    timestamp: new Date().toISOString()
  };
}

/**
 * Get up after a defeat - Resilience function
 */
function getUp(defeatReason) {
  console.log("💪 Getting up after defeat...");
  console.log(`💀 Defeat reason: ${defeatReason}`);
  console.log("🥊 Rising again. Strike harder this time.");
  
  return {
    recovered: true,
    defeatReason,
    timestamp: new Date().toISOString()
  };
}

/**
 * Threat logger - Log with aggressive formatting
 */
const logger = {
  threat: (message) => {
    console.log(`💀 THREAT: ${message}`);
  },
  victory: (message) => {
    console.log(`✅ VICTORY: ${message}`);
  },
  strike: (message) => {
    console.log(`🥊 STRIKE: ${message}`);
  },
  defeat: (message) => {
    console.log(`💀 DEFEAT: ${message}`);
  },
  warning: (message) => {
    console.log(`⚠️ WARNING: ${message}`);
  }
};

/**
 * Sensei mode - Get the current sensei configuration
 */
function getSenseiMode(config) {
  const modes = {
    'Kreese': { mercy: false, strictness: 100, phrase: 'No mercy!' },
    'Lawrence': { mercy: true, strictness: 70, phrase: 'Balance is key.' },
    'Silver': { mercy: false, strictness: 85, phrase: 'Winning is everything.' }
  };
  
  return modes[config.sensei?.mode] || modes['Kreese'];
}

/**
 * Execute a kata - Run a skill/practice routine
 */
async function executeKata(kataName, input) {
  console.log(`🥋 Executing kata: ${kataName}`);
  
  try {
    // Simulate kata execution
    const result = await new Promise(resolve => {
      setTimeout(() => {
        resolve({
          kata: kataName,
          input,
          output: `Result of ${kataName}`,
          success: true
        });
      }, 100);
    });
    
    logger.victory(`Kata ${kataName} completed successfully`);
    return result;
  } catch (error) {
    logger.defeat(`Kata ${kataName} failed: ${error.message}`);
    return getUp(error.message);
  }
}

/**
 * Train the student - Main training loop
 */
async function train(student, config) {
  const sensei = getSenseiMode(config);
  
  console.log(`\n👨‍🏫 Sensei Mode: ${config.sensei?.mode || 'Kreese'}`);
  console.log(`🗣️ Sensei says: "${sensei.phrase}"\n`);
  
  const training = await bowIn();
  
  return {
    training,
    sensei,
    student,
    started: new Date().toISOString()
  };
}

// Export for use in other modules
module.exports = {
  bowIn,
  sweepTheLeg,
  getUp,
  logger,
  getSenseiMode,
  executeKata,
  train,
  // Trophy functions
  earnTrophy,
  showTrophyCase,
  checkStreak,
  // Quote functions
  getQuote,
  injectQuote,
  startupQuote,
  victoryQuote,
  defeatQuote,
  patrolQuote,
  miyagiWisdom
};

// ============================================
// TROPHY SYSTEM
// ============================================

const TROPATH = './scrolls/trophies.json';

function readTrophies() {
  try {
    const fs = require('fs');
    if (fs.existsSync(TROPATH)) {
      return JSON.parse(fs.readFileSync(TROPATH, 'utf8'));
    }
  } catch (e) {
    return { diamonds: 0, golds: 0, silvers: 0, bronzes: 0, fires: 0, streak: 0, total: 0 };
  }
  return { diamonds: 0, golds: 0, silvers: 0, bronzes: 0, fires: 0, streak: 0, total: 0 };
}

function saveTrophies(t) {
  try {
    const fs = require('fs');
    fs.writeFileSync(TROPATH, JSON.stringify(t, null, 2));
  } catch (e) {
    console.log('💀 Could not save trophy:', e.message);
  }
}

/**
 * Record a trophy for the dojo
 */
function earnTrophy(type, taskName) {
  const medals = {
    'simple': '🥉',
    'medium': '🥈',
    'complex': '🥇',
    'critical': '💎'
  };
  
  const points = { simple: 1, medium: 3, complex: 5, critical: 10 };
  
  const t = readTrophies();
  
  // Increment based on type
  switch(type) {
    case 'diamond': t.diamonds++; t.total += 10; break;
    case 'gold': t.golds++; t.total += 5; break;
    case 'silver': t.silvers++; t.total += 3; break;
    case 'bronze': t.bronzes++; t.total += 1; break;
    default: t.bronzes++; t.total += 1;
  }
  
  t.streak++;
  
  // Check for streak bonus
  if (t.streak >= 3) {
    t.fires++;
    t.total += 2;
    console.log(`🔥 STREAK OF ${t.streak}! Bonus trophy awarded!`);
    t.streak = 0;
  }
  
  saveTrophies(t);
  
  console.log(`\n🏆 VICTORY! ${medals[type] || '🥉'} Trophy added to case.`);
  console.log(`   Task: ${taskName}`);
  console.log(`   Points: +${points[type] || 1}`);
  
  showTrophyCase();
  
  return { type, medal: medals[type] || '🥉', task: taskName, points: points[type] || 1 };
}

/**
 * Display the trophy case
 */
function showTrophyCase() {
  const t = readTrophies();
  
  console.log(`
🏆 COBRACLAW TROPHY CASE
============================
💎 Diamond: ${t.diamonds}
🥇 Gold:    ${t.golds}
🥈 Silver:  ${t.silvers}
🥉 Bronze:  ${t.bronzes}
🔥 Fire:    ${t.fires}
----------------------------
TOTAL:      ${t.total} VICTORIES
============================
  `);
}

/**
 * Check for streak bonus
 */
function checkStreak() {
  const t = readTrophies();
  if (t.streak >= 3) {
    console.log(`🔥 STREAK OF ${t.streak}! 🔥`);
    console.log("Bonus trophy awarded!");
    return true;
  }
  return false;
}

// ============================================
// QUOTES SYSTEM
// ============================================

const COBRA_QUOTES = {
  startup: [
    "Fear does not exist in this dojo.",
    "Strike first. Strike hard. No mercy.",
    "The enemy (bugs) never sleeps. Neither do we.",
    "Cobra Kai! Strike first!",
    "Today is a good day to conquer."
  ],
  victory: [
    "Another trophy for the dojo, Sensei!",
    "Victory is not given. It is taken.",
    "Champion grows stronger with each strike.",
    "No mercy on the field of battle.",
    "You strike. You conquer. You win."
  ],
  defeat: [
    "Defeat is a teacher, not a sentence.",
    "Get up! Strike again!",
    "A true warrior learns from failure.",
    "The fall makes the rise sweeter.",
    "No one stays down in this dojo."
  ],
  strike: [
    "Strike first. Strike hard.",
    "No mercy. No hesitation.",
    "Attack, always attack!",
    "Power through the pain.",
    "Finish it!"
  ],
  patrol: [
    "The dojo never sleeps. Neither do we.",
    "Vigilance is strength.",
    "A clean dojo is a victorious dojo.",
    "Patrol complete. More tasks await.",
    "Ready for the next battle."
  ]
};

const MIYAGI_QUOTES = {
  startup: [
    "Wax on, wax off.",
    "First learn walk, then learn run.",
    "Balance is not a place. It is a way of life.",
    "Walk on road. Always walk on road.",
    "Peace be with you, my friend."
  ],
  victory: [
    "'First learn walk, then learn run.' - Victory is yours.",
    "Balance in all things. Even victory.",
    "The student has surpassed the master.",
    "Jewel has many facets. This is a big one.",
    "Peace be with you. You earned it."
  ],
  defeat: [
    "Defeat is a lesson. Learn it well.",
    "The best mistake is the one you learn from.",
    "Face defeat with open mind.",
    "Nothing is like it seems. Try again.",
    "Jewel has many facets. This is just one."
  ],
  wisdom: [
    "Wax on, wax off.",
    "First learn walk, then learn run.",
    "Balance is not a place. It is a way of life.",
    "Walk on road. Always walk on road.",
    "Face opponent with open mind.",
    "Nothing is like it seems. Do not believe nose.",
    "Peace be with you, my friend.",
    "For you, strike first, strike hard—no mercy. For me, always peace.",
    "Jewel has many facets. One facet give whole jewel.",
    "The best mistake is the one you learn from."
  ]
};

/**
 * Get random quote based on context
 */
function getQuote(context, mode = 'adaptive') {
  let pool = COBRA_QUOTES[context] || COBRA_QUOTES.startup;
  
  if (mode === 'miyagi') {
    pool = MIYAGI_QUOTES[context] || MIYAGI_QUOTES.startup;
  } else if (mode === 'adaptive') {
    // Mix both
    const miyagiPool = MIYAGI_QUOTES[context] || MIYAGI_QUOTES.startup;
    pool = [...pool, ...miyagiPool];
  }
  
  return pool[Math.floor(Math.random() * pool.length)];
}

/**
 * Inject quote with formatting
 */
function injectQuote(context, mode = 'adaptive') {
  const quote = getQuote(context, mode);
  const isMiyagi = mode === 'miyagi';
  
  console.log('');
  if (isMiyagi) {
    console.log('     ╔═══════════════════════════════════════╗');
    console.log(`     ║ 🥋 ${quote}`);
    console.log('     ╚═══════════════════════════════════════╝');
  } else {
    console.log('╔═══════════════════════════════════════╗');
    console.log(`║ ${quote}`);
    console.log('╚═══════════════════════════════════════╝');
  }
  console.log('');
  
  return quote;
}

// Convenience functions
function startupQuote(mode = 'adaptive') { return injectQuote('startup', mode); }
function victoryQuote(mode = 'adaptive') { return injectQuote('victory', mode); }
function defeatQuote(mode = 'adaptive') { return injectQuote('defeat', mode); }
function patrolQuote(mode = 'adaptive') { return injectQuote('patrol', mode); }
function miyagiWisdom() { return injectQuote('wisdom', 'miyagi'); }
