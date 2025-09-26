const SAVESTATE_KEY = 'ink-savepoint'

function showAfter(delay, el) {
  setTimeout(() => {
    el.classList.add('show')
  }, delay)
}

let currentSection, delay
function newSection() {
  delay = 240
  currentSection = document.createElement('section')
  rootContainer.appendChild(currentSection)
}

function addParagraph(html) {
  const paragraphElement = document.createElement('p')
  paragraphElement.innerHTML = html
  currentSection.appendChild(paragraphElement)

  showAfter(delay, paragraphElement)
  delay += 160

  return paragraphElement
}

function addChoice(html, onclick) {
  const choiceAnchorEl = document.createElement('a')
  choiceAnchorEl.classList.add('choice')
  choiceAnchorEl.innerHTML = html
  choiceAnchorEl.addEventListener('click', (evt) => {
    evt.preventDefault()
    onclick()
  })

  currentSection.appendChild(choiceAnchorEl)

  showAfter(delay, choiceAnchorEl)
  delay += 80

  return choiceAnchorEl
}

function clearChoices() {
  const existingChoices = currentSection.querySelectorAll('a.choice')
  for (let c of existingChoices) {
    c.parentNode.removeChild(c)
  }
}

function clearSection() {
  currentSection.parentNode.removeChild(currentSection)
  currentSection = null
}

function scrollDown() {
  const limit = Math.max(
    0,
    document.documentElement.scrollHeight -
      document.documentElement.clientHeight
  )
  const target = Math.min(currentSection.offsetTop - 48, limit)

  const start = window.scrollY
  const dist = target - start
  const duration = 300 + (300 * dist) / 100

  let startTime = null
  function step(time) {
    if (startTime == null) startTime = time
    const t = (time - startTime) / duration
    const lerp = 3 * t * t - 2 * t * t * t // ease in/out
    window.scrollTo(0, (1.0 - lerp) * start + lerp * target)
    if (t < 1) requestAnimationFrame(step)
  }
  requestAnimationFrame(step)
}

function continueStory(story) {
  newSection()
  while (story.canContinue) {
    // story.currentTags
    addParagraph(story.Continue())
  }

  story.currentChoices.forEach((choice) => {
    addChoice(choice.text, decideStory.bind(null, choice.index))
  })

  // currentSection.scrollIntoView({
  //   behavior: 'smooth',
  //   block: 'start',
  //   inline: 'nearest',
  // })
  scrollDown()

  // console.log(story.variablesState._globalVariables)
}

function decideStory(choiceIndex) {
  clearChoices()
  // clearSection()
  story.ChooseChoiceIndex(choiceIndex)

  const savestate = story.state.toJson()
  window.localStorage.setItem(SAVESTATE_KEY, savestate)

  continueStory(story)
}

function askToResume(savestate) {
  newSection()
  addParagraph('<em>Welcome back.</em>')
  addParagraph(
    '<em>Would you like to resume from where you left off earlier?</em>'
  )

  addChoice('Yes, resume from there', () => {
    clearSection()
    story.state.LoadJson(savestate)
    continueStory(story)
  })
  addChoice('No, start over', () => {
    clearSection()
    window.localStorage.removeItem(SAVESTATE_KEY)
    continueStory(story)
  })
}

let story, rootContainer
function init() {
  story = new inkjs.Story(window.storydata)
  rootContainer = document.getElementById('root')

  // console.log({ globalTags: story.globalTags })

  // story.ObserveVariable('forceful', (varName, newValue) => {
  //   console.log({ varName, newValue })
  // })
  // story.ObserveVariable('evasive', (varName, newValue) => {
  //   console.log({ varName, newValue })
  // })
  // story.ObserveVariable('teacup', (varName, newValue) => {
  //   console.log({ varName, newValue })
  // })

  const savestate = window.localStorage.getItem(SAVESTATE_KEY)
  if (savestate) {
    askToResume(savestate)
  } else {
    continueStory(story)
  }
}

window.addEventListener('load', () => {
  window.setTimeout(init, 1800)
})
