(function () {
  'use strict';

  var canvas = document.getElementById('neural-bg');
  if (!canvas) return;
  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;

  var ctx = canvas.getContext('2d');
  var W, H, nodes;

  var NODE_COUNT = 14;
  var MAX_DIST   = 200;
  var BASE_COLOR = '43, 63, 78'; // --home-accent rgb

  // ── Sizing ────────────────────────────────────────────────────────────────
  function resize() {
    W = canvas.width  = window.innerWidth;
    H = canvas.height = window.innerHeight;
  }

  // ── Nodes ─────────────────────────────────────────────────────────────────
  function makeNode(i) {
    return {
      x:       Math.random() * W,
      y:       Math.random() * H,
      vx:      (Math.random() - 0.5) * 0.28,
      vy:      (Math.random() - 0.5) * 0.28,
      r:       Math.random() * 1.8 + 1.4,
      heart:   i === 0,   // one node pulses like a heartbeat
      phase:   Math.random() * Math.PI * 2
    };
  }

  function createNodes() {
    nodes = [];
    for (var i = 0; i < NODE_COUNT; i++) nodes.push(makeNode(i));
  }

  // ── Signal pulses ─────────────────────────────────────────────────────────
  var pulses = [];

  function schedulePulse() {
    setTimeout(function () {
      var a = Math.floor(Math.random() * nodes.length);
      var b = Math.floor(Math.random() * nodes.length);
      if (a !== b) {
        var dx = nodes[b].x - nodes[a].x;
        var dy = nodes[b].y - nodes[a].y;
        if (Math.sqrt(dx * dx + dy * dy) < MAX_DIST) {
          pulses.push({ a: a, b: b, t: 0, speed: 0.007 + Math.random() * 0.007 });
        }
      }
      schedulePulse();
    }, 700 + Math.random() * 1100);
  }

  // ── Draw loop ─────────────────────────────────────────────────────────────
  var tick = 0;

  function draw() {
    tick += 0.016;
    ctx.clearRect(0, 0, W, H);

    // Update positions
    nodes.forEach(function (n) {
      n.x += n.vx;
      n.y += n.vy;
      if (n.x < -25) n.x = W + 25;
      if (n.x > W + 25) n.x = -25;
      if (n.y < -25) n.y = H + 25;
      if (n.y > H + 25) n.y = -25;
    });

    // Edges
    for (var i = 0; i < nodes.length; i++) {
      for (var j = i + 1; j < nodes.length; j++) {
        var dx   = nodes[j].x - nodes[i].x;
        var dy   = nodes[j].y - nodes[i].y;
        var dist = Math.sqrt(dx * dx + dy * dy);
        if (dist < MAX_DIST) {
          var a = (1 - dist / MAX_DIST) * 0.22;
          ctx.beginPath();
          ctx.strokeStyle = 'rgba(' + BASE_COLOR + ',' + a + ')';
          ctx.lineWidth   = 1.0;
          ctx.moveTo(nodes[i].x, nodes[i].y);
          ctx.lineTo(nodes[j].x, nodes[j].y);
          ctx.stroke();
        }
      }
    }

    // Traveling pulses
    pulses = pulses.filter(function (p) {
      p.t += p.speed;
      if (p.t > 1) return false;
      var na  = nodes[p.a];
      var nb  = nodes[p.b];
      var px  = na.x + (nb.x - na.x) * p.t;
      var py  = na.y + (nb.y - na.y) * p.t;
      var pa  = Math.sin(p.t * Math.PI) * 0.55;
      ctx.beginPath();
      ctx.arc(px, py, 2.2, 0, Math.PI * 2);
      ctx.fillStyle = 'rgba(' + BASE_COLOR + ',' + pa + ')';
      ctx.fill();
      return true;
    });

    // Nodes
    nodes.forEach(function (n) {
      // Heartbeat ripple on the special node
      if (n.heart) {
        // ECG-style beat: sharp rise, quick fall
        var beat = tick * 1.1 + n.phase;
        var phase = beat % (Math.PI * 2);
        var ripple = Math.max(0, Math.exp(-Math.pow((phase - 1.2) * 2.2, 2)));
        if (ripple > 0.02) {
          ctx.beginPath();
          ctx.arc(n.x, n.y, n.r + ripple * 9, 0, Math.PI * 2);
          ctx.fillStyle = 'rgba(' + BASE_COLOR + ',' + (ripple * 0.18) + ')';
          ctx.fill();
        }
      }

      ctx.beginPath();
      ctx.arc(n.x, n.y, n.r, 0, Math.PI * 2);
      ctx.fillStyle = 'rgba(' + BASE_COLOR + ',0.42)';
      ctx.fill();
    });

    requestAnimationFrame(draw);
  }

  // ── Init ──────────────────────────────────────────────────────────────────
  resize();
  createNodes();
  schedulePulse();
  draw();

  window.addEventListener('resize', function () { resize(); createNodes(); });
})();
