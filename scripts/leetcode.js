/* Enum for languages supported by LeetCode. */
const languages = {
  Python: '.py',
  Python3: '.py',
  'C++': '.cpp',
  C: '.c',
  Java: '.java',
  'C#': '.cs',
  JavaScript: '.js',
  Ruby: '.rb',
  Swift: '.swift',
  Go: '.go',
  Kotlin: '.kt',
  Scala: '.scala',
  Rust: '.rs',
  PHP: '.php',
  TypeScript: '.ts',
  MySQL: '.sql',
  'MS SQL Server': '.sql',
  Oracle: '.sql',
};

/* Commit messages */
const readmeMsg = 'Create README - LeetHub';
const discussionMsg = 'Prepend discussion post - LeetHub';

/* Difficulty of most recenty submitted question */
let difficulty = '';

/* Get file extension for submission */
function findLanguage() {
  const tag = [
    ...document.getElementsByClassName(
      'ant-select-selection-selected-value',
    ),
  ];
  if (tag && tag.length > 0) {
    for (let i = 0; i < tag.length; i += 1) {
      const elem = tag[i].textContent;
      if (elem !== undefined && languages[elem] !== undefined) {
        return languages[elem]; // should generate respective file extension
      }
    }
  }
  return null;
}

/* Main function for uploading code to GitHub repo */
const upload = (token, hook, code, directory, filename, sha, msg) => {
  // To validate user, load user object from GitHub.
  const URL = `https://api.github.com/repos/${hook}/contents/${directory}/${filename}`;

  /* Define Payload */
  let data = {
    message: msg,
    content: code,
    sha,
  };

  data = JSON.stringify(data);

  const xhr = new XMLHttpRequest();
  xhr.addEventListener('readystatechange', function () {
    if (xhr.readyState === 4) {
      if (xhr.status === 200 || xhr.status === 201) {
        const updatedSha = JSON.parse(xhr.responseText).content.sha; // get updated SHA.

        chrome.storage.sync.get('stats', (data2) => {
          let { stats } = data2;
          if (stats === null || stats === {} || stats === undefined) {
            // create stats object
            stats = {};
            stats.solved = 0;
            stats.easy = 0;
            stats.medium = 0;
            stats.hard = 0;
            stats.sha = {};
          }
          const filePath = directory + filename;
          // Only increment solved problems statistics once
          // New submission commits twice (README and problem)
          if (filename === 'README.md' && sha === null) {
            stats.solved += 1;
            stats.easy += difficulty === 'Easy' ? 1 : 0;
            stats.medium += difficulty === 'Medium' ? 1 : 0;
            stats.hard += difficulty === 'Hard' ? 1 : 0;
          }
          stats.sha[filePath] = updatedSha; // update sha key.
          chrome.storage.sync.set({ stats }, () => {
            console.log(
              `Successfully committed ${filename} to github`,
            );
          });
        });
      }
    }
  });
  xhr.open('PUT', URL, true);
  xhr.setRequestHeader('Authorization', `token ${token}`);
  xhr.setRequestHeader('Accept', 'application/vnd.github.v3+json');
  xhr.send(data);
};

/* Main function for updating code on GitHub Repo */
/* Currently only used for prepending discussion posts to README */
const update = (token, hook, addition, directory, msg, prepend) => {
  const URL = `https://api.github.com/repos/${hook}/contents/${directory}/README.md`;

  /* Read from existing file on GitHub */
  const xhr = new XMLHttpRequest();
  xhr.addEventListener('readystatechange', function () {
    if (xhr.readyState === 4) {
      if (xhr.status === 200 || xhr.status === 201) {
        const response = JSON.parse(xhr.responseText);
        const existingContent = decodeURIComponent(
          escape(atob(response.content)),
        );
        let newContent = '';

        /* Discussion posts prepended at top of README */
        /* Future implementations may require appending to bottom of file */
        if (prepend) {
          newContent = btoa(
            unescape(encodeURIComponent(addition + existingContent)),
          );
        }

        /* Write file with new content to GitHub */
        upload(
          token,
          hook,
          newContent,
          directory,
          'README.md',
          response.sha,
          msg,
        );
      }
    }
  });
  xhr.open('GET', URL, true);
  xhr.setRequestHeader('Authorization', `token ${token}`);
  xhr.setRequestHeader('Accept', 'application/vnd.github.v3+json');
  xhr.send();
};

function uploadGit(
  code,
  problemName,
  fileName,
  msg,
  action,
  prepend = true,
) {
  /* Get necessary payload data */
  chrome.storage.sync.get('leethub_token', (t) => {
    const token = t.leethub_token;
    if (token) {
      chrome.storage.sync.get('mode_type', (m) => {
        const mode = m.mode_type;
        if (mode === 'commit') {
          /* Get hook */
          chrome.storage.sync.get('leethub_hook', (h) => {
            const hook = h.leethub_hook;
            if (hook) {
              /* Get SHA, if it exists */

              /* to get unique key */
              const filePath = problemName + fileName;
              chrome.storage.sync.get('stats', (s) => {
                const { stats } = s;
                let sha = null;

                if (
                  stats !== undefined &&
                  stats.sha !== undefined &&
                  stats.sha[filePath] !== undefined
                ) {
                  sha = stats.sha[filePath];
                }

                if (action === 'upload') {
                  /* Upload to git. */
                  upload(
                    token,
                    hook,
                    code,
                    problemName,
                    fileName,
                    sha,
                    msg,
                  );
                } else if (action === 'update') {
                  /* Update on git */
                  update(
                    token,
                    hook,
                    code,
                    problemName,
                    msg,
                    prepend,
                  );
                }
              });
            }
          });
        }
      });
    }
  });
}

/* Main parser function for the code */
function parseCode() {
  const e = document.getElementsByClassName('CodeMirror-code');
  if (e !== undefined && e.length > 0) {
    const elem = e[0];
    let parsedCode = '';
    const textArr = elem.innerText.split('\n');
    for (let i = 1; i < textArr.length; i += 2) {
      parsedCode += `${textArr[i]}\n`;
    }
    return parsedCode;
  }
  return null;
}

/* Util function to check if an element exists */
function checkElem(elem) {
  return elem && elem.length > 0;
}

/* Parser function for the question and tags */
function parseQuestion() {
  const questionElem = document.getElementsByClassName(
    'content__u3I1 question-content__JfgR',
  );
  if (!checkElem(questionElem)) {
    return null;
  }
  const qbody = questionElem[0].innerHTML;

  // Problem title.
  let qtitle = document.getElementsByClassName('css-v3d350');
  if (checkElem(qtitle)) {
    qtitle = qtitle[0].innerHTML;
  } else {
    qtitle = 'unknown-problem';
  }

  // Problem difficulty, each problem difficulty has its own class.
  const isHard = document.getElementsByClassName('css-t42afm');
  const isMedium = document.getElementsByClassName('css-dcmtd5');
  const isEasy = document.getElementsByClassName('css-14oi08n');

  if (checkElem(isEasy)) {
    difficulty = 'Easy';
  } else if (checkElem(isMedium)) {
    difficulty = 'Medium';
  } else if (checkElem(isHard)) {
    difficulty = 'Hard';
  }
  // Final formatting of the contents of the README for each problem
  const markdown = `<h2>${qtitle}</h2><h3>${difficulty}</h3><hr>${qbody}`;
  return markdown;
}

/* Parser function for time/space stats */
function parseStats() {
  const probStats = document.getElementsByClassName('data__HC-i');
  if (!checkElem(probStats)) {
    return null;
  }
  const time = probStats[0].textContent;
  const timePercentile = probStats[1].textContent;
  const space = probStats[2].textContent;
  const spacePercentile = probStats[3].textContent;

  // Format commit message
  return `Time: ${time} (${timePercentile}), Space: ${space} (${spacePercentile}) - LeetHub`;
}

document.addEventListener('click', (event) => {
  const element = event.target;
  const oldPath = window.location.pathname;

  /* Act on Post button click */
  /* Complex since "New" button shares many of the same properties as "Post button */
  if (
    element.classList.contains('icon__3Su4') ||
    element.parentElement.classList.contains('icon__3Su4') ||
    element.parentElement.classList.contains(
      'btn-content-container__214G',
    ) ||
    element.parentElement.classList.contains('header-right__2UzF')
  ) {
    setTimeout(function () {
      /* Only post if post button was clicked and url changed */
      if (
        oldPath !== window.location.pathname &&
        oldPath ===
          window.location.pathname.substring(0, oldPath.length) &&
        !Number.isNaN(window.location.pathname.charAt(oldPath.length))
      ) {
        const date = new Date();
        const currentDate = `${date.getDate()}/${date.getMonth()}/${date.getFullYear()} at ${date.getHours()}:${date.getMinutes()}`;
        const addition = `[Discussion Post (created on ${currentDate})](${window.location})  \n`;
        const problemName = window.location.pathname.split('/')[2]; // must be true.

        uploadGit(
          addition,
          problemName,
          'README.md',
          discussionMsg,
          'update',
        );
      }
    }, 1000);
  }
});

const loader = setInterval(() => {
  let code = null;
  let probStatement = null;
  let probStats = null;

  const successTag = document.getElementsByClassName('success__3Ai7');
  if (
    successTag !== undefined &&
    successTag.length > 0 &&
    successTag[0].innerText.trim() === 'Success'
  ) {
    code = parseCode();
    probStatement = parseQuestion();
    probStats = parseStats();
  }
  if (code !== null && probStatement !== null && probStats !== null) {
    clearTimeout(loader);
    const problemName = window.location.pathname.split('/')[2]; // must be true.
    const language = findLanguage();
    if (language !== null) {

      chrome.storage.sync.get('stats', (s) => {
        const { stats } = s;
        const filePath = problemName + problemName + language;
        let sha = null;
        if (
          stats !== undefined &&
          stats.sha !== undefined &&
          stats.sha[filePath] !== undefined
        ) {
          sha = stats.sha[filePath];
        }

        /* Only create README if not already created */
        if (sha === null) {
          /* @TODO: Change this setTimeout to Promise */
          uploadGit(
            btoa(unescape(encodeURIComponent(probStatement))),
            problemName,
            'README.md',
            readmeMsg,
            'upload',
          );
        }
      });

      /* Upload code to Git */
      setTimeout(function () {
        uploadGit(
          btoa(unescape(encodeURIComponent(code))),
          problemName,
          problemName + language,
          probStats,
          'upload',
        ); // Encode `code` to base64
      }, 2000);
    }
  }
}, 1000);