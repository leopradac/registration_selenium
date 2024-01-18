import os
import subprocess


def run():
    def run_behave():
        project_path = './'
        # Use subprocess to run the 'behave' command
        try:
            close = input("this will close google chrome, are you sure?")
            if close.lower() in ['yes', 'y']:
                os.environ['DEBUG_ON'] = 'true'
                try:
                    subprocess.run(['pkill', '-f', 'Google Chrome'], check=True)
                except Exception as e:
                    print(e)
                subprocess.run([
                    'behave'
                ], cwd=project_path, check=True, shell=True)
        except subprocess.CalledProcessError as e:
            print(f"Execution failed with error: {e}")

    if __name__ == "__main__":
        run_behave()


if __name__ == '__main__':
    run()
